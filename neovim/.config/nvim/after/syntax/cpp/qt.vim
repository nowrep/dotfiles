if (exists("g:qt_syntax") && !g:qt_syntax) || &cp
    finish
endif

syn keyword qtClass QAbstractAnimation QAbstractButton QAbstractEventDispatcher QAbstractExtensionFactory QAbstractExtensionManager QAbstractFileEngine QAbstractFileEngineHandler QAbstractFileEngineIterator QAbstractFontEngine QAbstractFormBuilder QAbstractGraphicsShapeItem QAbstractItemDelegate QAbstractItemModel QAbstractItemView QAbstractListModel QAbstractMessageHandler QAbstractNetworkCache QAbstractPrintDialog QAbstractProxyModel QAbstractScrollArea QAbstractSlider QAbstractSocket QAbstractSpinBox QAbstractState QAbstractTableModel QAbstractTextDocumentLayout QAbstractTransition QAbstractUriResolver QAbstractVideoBuffer QAbstractVideoSurface QAbstractXmlNodeModel QAbstractXmlReceiver QAccessible QAccessibleBridge QAccessibleBridgePlugin QAccessibleEvent QAccessibleInterface QAccessibleObject QAccessiblePlugin QAccessibleWidget QAction QActionEvent QActionGroup QAnimationGroup QApplication QAtomicInt QAtomicPointer QAudioDeviceInfo QAudioFormat QAudioInput QAudioOutput QAuthenticator QAxAggregated QAxBase QAxBindable QAxFactory QAxObject QAxScript QAxScriptEngine QAxScriptManager QAxWidget QBasicTimer QBitArray QBitmap QBoxLayout QBrush QBuffer QButtonGroup QByteArray QByteArrayLiteral QByteArrayMatcher QCache QCalendarWidget QCDEStyle QChar QCheckBox QChildEvent QCleanlooksStyle QClipboard QCloseEvent QColor QColorDialog QColormap QColumnView QComboBox QCommandLinkButton QCommonStyle QCompleter QConicalGradient QContextMenuEvent QContiguousCache QCopChannel QCoreApplication QCryptographicHash QCursor QCustomRasterPaintDevice QDataStream QDataWidgetMapper QDate QDateEdit QDateTime QDateTimeEdit QDBusAbstractAdaptor QDBusAbstractInterface QDBusArgument QDBusConnection QDBusConnectionInterface QDBusContext QDBusError QDBusInterface QDBusMessage QDBusObjectPath QDBusPendingCall QDBusPendingCallWatcher QDBusPendingReply QDBusReply QDBusServiceWatcher QDBusSignature QDBusVariant QDebug QDeclarativeComponent QDeclarativeContext QDeclarativeEngine QDeclarativeError QDeclarativeExpression QDeclarativeExtensionPlugin QDeclarativeImageProvider QDeclarativeImportDatabase QDeclarativeItem QDeclarativeListProperty QDeclarativeListReference QDeclarativeNetworkAccessManagerFactory QDeclarativeParserStatus QDeclarativeProperty QDeclarativePropertyMap QDeclarativePropertyValueSource QDeclarativeScriptString QDeclarativeTypeLoader QDeclarativeView QDecoration QDecorationDefault QDecorationFactory QDecorationPlugin QDesignerActionEditorInterface QDesignerContainerExtension QDesignerCustomWidgetCollectionInterface QDesignerCustomWidgetInterface QDesignerDynamicPropertySheetExtension QDesignerFormEditorInterface QDesignerFormWindowCursorInterface QDesignerFormWindowInterface QDesignerFormWindowManagerInterface QDesignerMemberSheetExtension QDesignerObjectInspectorInterface QDesignerPropertyEditorInterface QDesignerPropertySheetExtension QDesignerTaskMenuExtension QDesignerWidgetBoxInterface QDesktopServices QDesktopWidget QDial QDialog QDialogButtonBox QDir QDirectPainter QDirIterator QDockWidget QDomAttr QDomCDATASection QDomCharacterData QDomComment QDomDocument QDomDocumentFragment QDomDocumentType QDomElement QDomEntity QDomEntityReference QDomImplementation QDomNamedNodeMap QDomNode QDomNodeList QDomNotation QDomProcessingInstruction QDomText QDoubleSpinBox QDoubleValidator QDrag QDragEnterEvent QDragLeaveEvent QDragMoveEvent QDropEvent QDynamicPropertyChangeEvent QEasingCurve Effect EffectParameter EffectWidget QElapsedTimer QErrorMessage QEvent QEventLoop QEventTransition Exception QExplicitlySharedDataPointer QExtensionFactory QExtensionManager QFile QFileDialog QFileIconProvider QFileInfo QFileOpenEvent QFileSystemModel QFileSystemWatcher QFinalState QFlag QFlags QFocusEvent QFocusFrame QFont QFontComboBox QFontDatabase QFontDialog QFontEngineInfo QFontEnginePlugin QFontInfo QFontMetrics QFontMetricsF QFormBuilder QFormLayout QFrame QFSFileEngine QFtp QFuture QFutureIterator QFutureSynchronizer QFutureWatcher QGenericArgument QGenericMatrix QGenericReturnArgument QGesture QGestureEvent QGestureRecognizer QGLBuffer QGLColormap QGLContext QGLFormat QGLFramebufferObject QGLFramebufferObjectFormat QGLPixelBuffer QGLShader QGLShaderProgram QGLWidget QGradient QGraphicsAnchor QGraphicsAnchorLayout QGraphicsBlurEffect QGraphicsColorizeEffect QGraphicsDropShadowEffect QGraphicsEffect QGraphicsEllipseItem QGraphicsGridLayout QGraphicsItem QGraphicsItemAnimation QGraphicsItemGroup QGraphicsLayout QGraphicsLayoutItem QGraphicsLinearLayout QGraphicsLineItem QGraphicsObject QGraphicsOpacityEffect QGraphicsPathItem QGraphicsPixmapItem QGraphicsPolygonItem QGraphicsProxyWidget QGraphicsRectItem QGraphicsRotation QGraphicsScale QGraphicsScene QGraphicsSceneContextMenuEvent QGraphicsSceneDragDropEvent QGraphicsSceneEvent QGraphicsSceneHelpEvent QGraphicsSceneHoverEvent QGraphicsSceneMouseEvent QGraphicsSceneMoveEvent QGraphicsSceneResizeEvent QGraphicsSceneWheelEvent QGraphicsSimpleTextItem QGraphicsSvgItem QGraphicsTextItem QGraphicsTransform QGraphicsView QGraphicsWebView QGraphicsWidget QGridLayout QGroupBox QGtkStyle QHash QHashIterator QHBoxLayout QHeaderView QHelpContentItem QHelpContentModel QHelpContentWidget QHelpEngine QHelpEngineCore QHelpEvent QHelpIndexModel QHelpIndexWidget QHelpSearchEngine QHelpSearchQuery QHelpSearchQueryWidget QHelpSearchResultWidget QHideEvent QHistoryState QHostAddress QHostInfo QHoverEvent QIcon QIconDragEvent QIconEngine QIconEnginePlugin QIconEnginePluginV2 QIconEngineV2 QImage QImageIOHandler QImageIOPlugin QImageReader QImageWriter QInputContext QInputContextFactory QInputContextPlugin QInputDialog QInputEvent QInputMethodEvent QIntValidator QIODevice QItemDelegate QItemEditorCreator QItemEditorCreatorBase QItemEditorFactory QItemSelection QItemSelectionModel QItemSelectionRange QKbdDriverFactory QKbdDriverPlugin QKeyEvent QKeyEventTransition QKeySequence QLabel QLatin1Char QLatin1String QStringLiteral QLayout QLayoutItem QLCDNumber QLibrary QLibraryInfo QLine QLinearGradient QLineEdit QLineF QLinkedList QLinkedListIterator QList QListIterator QListView QListWidget QListWidgetItem QLocale QLocalServer QLocalSocket QMacCocoaViewContainer QMacNativeWidget QMacPasteboardMime QMacStyle QMainWindow QMap QMapIterator QMargins QMatrix4x4 QMdiArea QMdiSubWindow MediaController MediaNode MediaObject MediaSource QMenu QMenuBar QMessageBox QMetaClassInfo QMetaEnum QMetaMethod QMetaObject QMetaProperty QMetaType QMimeData QModelIndex QMotifStyle QMouseDriverFactory QMouseDriverPlugin QMouseEvent QMouseEventTransition QMoveEvent QMovie QMultiHash QMultiMap QMutableHashIterator QMutableLinkedListIterator QMutableListIterator QMutableMapIterator QMutableSetIterator QMutableVectorIterator QMutex QMutexLocker QNetworkAccessManager QNetworkAddressEntry QNetworkCacheMetaData QNetworkConfiguration QNetworkConfigurationManager QNetworkCookie QNetworkCookieJar QNetworkDiskCache QNetworkInterface QNetworkProxy QNetworkProxyFactory QNetworkProxyQuery QNetworkReply QNetworkRequest QNetworkSession Notifier QObject QObjectCleanupHandler ObjectDescription QPageSetupDialog QPaintDevice QPaintEngine QPaintEngineState QPainter QPainterPath QPainterPathStroker QPaintEvent QPair QPalette QPanGesture QParallelAnimationGroup Path QPauseAnimation QPen QPersistentModelIndex QPicture QPinchGesture QPixmap QPixmapCache QPlainTextDocumentLayout QPlainTextEdit QPlastiqueStyle QPluginLoader QPoint QPointer QPointF QPolygon QPolygonF QPrintDialog QPrintEngine QPrinter QPrinterInfo QPrintPreviewDialog QPrintPreviewWidget QProcess QProcessEnvironment QProgressBar QProgressDialog QPropertyAnimation QProxyScreen QProxyScreenCursor QProxyStyle QPushButton QTouchEventSequence QQuaternion QQueue QRadialGradient QRadioButton QRasterPaintEngine QReadLocker QReadWriteLock QRect QRectF QRegExp QRegExpValidator QRegion QResizeEvent QResource QRubberBand QRunnable QS60MainApplication QS60MainAppUi QS60MainDocument QS60Style QScopedArrayPointer QScopedPointer QScreen QScreenCursor QScreenDriverFactory QScreenDriverPlugin QScriptable QScriptClass QScriptClassPropertyIterator QScriptContext QScriptContextInfo QScriptEngine QScriptEngineAgent QScriptEngineDebugger QScriptExtensionPlugin QScriptProgram QScriptString QScriptSyntaxCheckResult QScriptValue QScriptValueIterator QScrollArea QScrollBar SeekSlider QSemaphore QSequentialAnimationGroup QSessionManager QSet QSetIterator QSettings QSharedData QSharedDataPointer QSharedMemory QSharedPointer QShortcut QShortcutEvent QShowEvent QSignalMapper QSignalSpy QSignalTransition QSimpleXmlNodeModel QSize QSizeF QSizeGrip QSizePolicy QSlider QSocketNotifier QSortFilterProxyModel QSound QSourceLocation QSpacerItem QSpinBox QSplashScreen QSplitter QSplitterHandle QSqlDatabase QSqlDriver QSqlDriverCreator QSqlDriverCreatorBase QSqlDriverPlugin QSqlError QSqlField QSqlIndex QSqlQuery QSqlQueryModel QSqlRecord QSqlRelation QSqlRelationalDelegate QSqlRelationalTableModel QSqlResult QSqlTableModel QSslCertificate QSslCipher QSslConfiguration QSslError QSslKey QSslSocket QStack QStackedLayout QStackedWidget QStandardItem QStandardItemEditorCreator QStandardItemModel QState QStateMachine QStaticText QStatusBar QStatusTipEvent QString QStringList QStringListModel QStringMatcher QStringRef QStyle QStyledItemDelegate QStyleFactory QStyleHintReturn QStyleHintReturnMask QStyleHintReturnVariant QStyleOption QStyleOptionButton QStyleOptionComboBox QStyleOptionComplex QStyleOptionDockWidget QStyleOptionFocusRect QStyleOptionFrame QStyleOptionFrameV2 QStyleOptionFrameV3 QStyleOptionGraphicsItem QStyleOptionGroupBox QStyleOptionHeader QStyleOptionMenuItem QStyleOptionProgressBar QStyleOptionProgressBarV2 QStyleOptionQ3DockWindow QStyleOptionQ3ListView QStyleOptionQ3ListViewItem QStyleOptionRubberBand QStyleOptionSizeGrip QStyleOptionSlider QStyleOptionSpinBox QStyleOptionTab QStyleOptionTabBarBase QStyleOptionTabBarBaseV2 QStyleOptionTabV2 QStyleOptionTabV3 QStyleOptionTabWidgetFrame QStyleOptionTabWidgetFrameV2 QStyleOptionTitleBar QStyleOptionToolBar QStyleOptionToolBox QStyleOptionToolBoxV2 QStyleOptionToolButton QStyleOptionViewItem QStyleOptionViewItemV2 QStyleOptionViewItemV3 QStyleOptionViewItemV4 QStylePainter QStylePlugin QSvgGenerator QSvgRenderer QSvgWidget QSwipeGesture QSymbianEvent QSyntaxHighlighter QSysInfo QSystemLocale QSystemSemaphore QSystemTrayIcon QTabBar QTabletEvent QTableView QTableWidget QTableWidgetItem QTableWidgetSelectionRange QTabWidget QTapAndHoldGesture QTapGesture QTcpServer QTcpSocket QTemporaryFile QTestEventList QTextBlock QTextBlockFormat QTextBlockGroup QTextBlockUserData QTextBoundaryFinder QTextBrowser QTextCharFormat QTextCodec QTextCodecPlugin QTextCursor QTextDecoder QTextDocument QTextDocumentFragment QTextDocumentWriter QTextEdit QTextEncoder QTextFormat QTextFragment QTextFrame QTextFrameFormat QTextImageFormat QTextInlineObject QTextItem QTextLayout QTextLength QTextLine QTextList QTextListFormat QTextObject QTextObjectInterface QTextOption QTextStream QTextTable QTextTableCell QTextTableCellFormat QTextTableFormat QThread QThreadPool QThreadStorage QTileRules QTime QTimeEdit QTimeLine QTimer QTimerEvent QToolBar QToolBox QToolButton QToolTip QTouchEvent QTransform QTranslator QTreeView QTreeWidget QTreeWidgetItem QTreeWidgetItemIterator QUdpSocket QUiLoader QUndoCommand QUndoGroup QUndoStack QUndoView UnhandledException QUrl QUrlInfo QUuid QValidator QVariant QVariantAnimation QVarLengthArray QVBoxLayout QVector QVector2D QVector3D QVector4D QVectorIterator QVideoFrame VideoPlayer QVideoSurfaceFormat VideoWidget VolumeSlider QWaitCondition QWeakPointer QWebDatabase QWebElement QWebElementCollection QWebFrame QWebHistory QWebHistoryInterface QWebHistoryItem QWebHitTestResult QWebInspector QWebPage QWebPluginFactory QWebSecurityOrigin QWebSettings QWebView QWhatsThis QWhatsThisClickedEvent QWheelEvent QWidget QWidgetAction QWidgetItem QWindowsMime QWindowsStyle QWindowStateChangeEvent QWindowsVistaStyle QWindowsXPStyle QWizard QWizardPage QWriteLocker QWSCalibratedMouseHandler QWSClient QWSEmbedWidget QWSEvent QWSGLWindowSurface QWSInputMethod QWSKeyboardHandler QWSMouseHandler QWSPointerCalibrationData QWSScreenSaver QWSServer QWSWindow QX11EmbedContainer QX11EmbedWidget QX11Info QXmlAttributes QXmlContentHandler QXmlDeclHandler QXmlDefaultHandler QXmlDTDHandler QXmlEntityResolver QXmlErrorHandler QXmlFormatter QXmlInputSource QXmlItem QXmlLexicalHandler QXmlLocator QXmlName QXmlNamePool QXmlNamespaceSupport QXmlNodeModelIndex QXmlParseException QXmlQuery QXmlReader QXmlResultItems QXmlSchema QXmlSchemaValidator QXmlSerializer QXmlSimpleReader QXmlStreamAttribute QXmlStreamAttributes QXmlStreamEntityDeclaration QXmlStreamEntityResolver QXmlStreamNamespaceDeclaration QXmlStreamNotationDeclaration QXmlStreamReader QXmlStreamWriter
hi def link QtObject Type
hi def link qtClass QtObject

syn keyword qtMacros SLOT SIGNAL connect slots signals Q_ARG Q_ASSERT Q_ASSERT_X Q_CLASSINFO Q_DECLARE_EXTENSION_INTERFACE Q_DECLARE_FLAGS Q_DECLARE_INTERFACE Q_DECLARE_METATYPE Q_DECLARE_OPERATORS_FOR_FLAGS Q_DECLARE_TR_FUNCTIONS Q_DECLARE_TYPEINFO Q_DECL_EXPORT Q_DECL_IMPORT Q_DISABLE_COPY Q_EMIT Q_ENUMS Q_EXPORT_PLUGIN2 Q_FLAGS Q_FOREACH Q_FOREVER Q_FUNC_INFO Q_IMPORT_PLUGIN Q_INIT_RESOURCE Q_INT64_C Q_INTERFACES Q_INVOKABLE Q_LITTLE_ENDIAN Q_NOREPLY Q_OBJECT Q_PROPERTY Q_RETURN_ARG Q_SCRIPT_DECLARE_QMETAOBJECT Q_SIGNAL Q_SIGNALS Q_SLOT Q_SLOTS Q_UNUSED
hi def link qtMacros QtObject

syn keyword kdeMacros L_Override PLASMA_EXPORT KDE_EXPORT LANCELOT_EXPORT kDebug
hi def link kdeMacros QtObject

syn keyword qtKeywords foreach forever Q_FOREACH Q_FOREVER emit Q_EMIT Q_FLAGS Q_ENUMS qt_cast qobject_cast qvariant_cast qstyleoption_cast qgraphicsitem_cast
hi def link qtKeywords Keyword

syn region syntax_qtDebug start="qDebug" end=";"

hi syntax_qtDebug guifg=darkgray ctermfg=darkgray gui=italic term=italic

syn region syntax_qtWarning start="qWarning" end=";"

hi syntax_qtWarning guifg=yellow ctermfg=yellow

syn region syntax_qtFatal start="qFatal" end=";"

hi syntax_qtFatal guifg=red ctermfg=red

syn region syntax_qtCritical start="qCritical" end=";"

hi syntax_qtCritical guifg=red guibg=black ctermfg=red

syn region syntax_kdeDebug start="kDebug" end=";"

hi syntax_kdeDebug guifg=darkgray ctermfg=gray gui=italic term=italic

syn region syntax_rudolfDebug start="rDebug" end=";"

hi syntax_rudolfDebug guifg=darkgray ctermfg=darkgray gui=italic term=italic

syn region syntax_rudolfWarning start="rWarning" end=";"

hi syntax_rudolfWarning guifg=yellow guibg=black ctermfg=yellow

syn region syntax_rudolfCritical start="rCritical" end=";"

hi syntax_rudolfCritical guifg=red guibg=black ctermfg=red

iabbrev cqs const QString &
iabbrev re return
iabbrev de delete
iabbrev dbg qDebug() <<

