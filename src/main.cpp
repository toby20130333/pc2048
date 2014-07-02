#include <QApplication>
#include <QQmlApplicationEngine>
#include "echoclient.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    app.setOrganizationName("dtuandui");
    app.setOrganizationDomain("www.dtuandui.net");
    app.setApplicationName("2048 PC版本");
    EchoClient client(QUrl(QStringLiteral("ws://localhost:1234")));
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///qml/main.qml")));

    return app.exec();
}
