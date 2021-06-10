// g++ -O3 -linput -ludev evkeybind.cpp -o evkeybind

#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

#include <iostream>
#include <libudev.h>
#include <libinput.h>
#include <linux/input.h>

static const char *MUTE_SCRIPT = "/home/david/.config/i3/pulseaudio-mute-toggle.sh";
static const char *KEYBOARD_DEVICE_NAME = "TMK. FC980C Alt Controller Consumer Control";

static int open_restricted(const char *path, int flags, void *user_data)
{
    int fd = open(path, flags);
    return fd < 0 ? -errno : fd;
}

static void close_restricted(int fd, void *user_data)
{
    close(fd);
}

static const struct libinput_interface interface = {
    .open_restricted = open_restricted,
    .close_restricted = close_restricted,
};

static const char *find_keyboard()
{
    const char *devname = nullptr;

    bool grab = false;
    struct udev *udev = udev_new();
    struct libinput *li = libinput_udev_create_context(&interface, &grab, udev);
    libinput_udev_assign_seat(li, "seat0");

    libinput_dispatch(li);
    while (struct libinput_event *ev = libinput_get_event(li)) {
        if (libinput_event_get_type(ev) == LIBINPUT_EVENT_DEVICE_ADDED) {
            struct libinput_device *dev = libinput_event_get_device(ev);
            if (strcmp(libinput_device_get_name(dev), KEYBOARD_DEVICE_NAME) == 0) {
                struct udev_device *udev_device = libinput_device_get_udev_device(dev);
                devname = udev_device_get_devnode(udev_device);
            }
        }
        libinput_event_destroy(ev);
        libinput_dispatch(li);
        if (devname) {
            break;
        }
    }

    libinput_unref(li);

    return devname;
}

int main(int argc, char ** argv)
{
    const char *keydev = find_keyboard();
    if (!keydev) {
        std::cerr << "Failed to find keyboard" << std::endl;
        return 1;
    }

    std::cout << "Reading events from " << keydev << std::endl;

    int fd = open(keydev, O_RDONLY);
    if (fd < 0) {
        perror("Failed to open device");
        return 1;
    }

    while (true) {
        struct input_event ev;
        ssize_t n = read(fd, &ev, sizeof(ev));
        if (n == sizeof(ev)) {
            if (ev.type == EV_KEY && ev.value == 1) {
                switch (ev.code) {
                case KEY_FILE:
                    system(MUTE_SCRIPT);
                    break;
                default:
                    break;
                }
            }
        }
    }

    close(fd);
    return 0;
}
