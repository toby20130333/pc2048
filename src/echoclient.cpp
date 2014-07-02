/****************************************************************************
**
** Copyright (C) 2014 Kurt Pattyn <pattyn.kurt@gmail.com>.
** Contact: http://www.qt-project.org/legal
**
** This file is part of the QtWebSockets module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
****************************************************************************/
#include "echoclient.h"
#include <QtCore/QDebug>

QT_USE_NAMESPACE

//! [constructor]
EchoClient::EchoClient(const QUrl &url, QObject *parent) :
    QObject(parent),
    m_url(url)
{
    connect(&m_webSocket, &QWebSocket::connected, this, &EchoClient::onConnected);
    connect(&m_webSocket, &QWebSocket::disconnected, this, &EchoClient::onClosed);
    //connect(&m_webSocket, &QWebSocket::error, this, &EchoClient::onError);
    m_webSocket.open(QUrl(url));
}

QString EchoClient::getMacAddress()
{
    QList<QNetworkInterface> list = QNetworkInterface::allInterfaces();
    //获取所有网络接口的列表
    QString allPcinfo="";
    foreach(QNetworkInterface interface,list)
    {  //遍历每一个网络接口
        allPcinfo.append(interface.name());
        //设备名
        allPcinfo.append(interface.hardwareAddress());
        //硬件地址
        QList<QNetworkAddressEntry> entryList =interface.addressEntries();
        //获取IP地址条目列表，每个条目中包含一个IP地址，一个子网掩码和一个广播地址
        foreach(QNetworkAddressEntry entry,entryList)
        {//遍历每一个IP地址条目
            allPcinfo.append(entry.ip().toString());
            //IP地址
            allPcinfo.append(entry.netmask().toString());
            //子网掩码
            allPcinfo.append(entry.broadcast().toString());
            //广播地址
        }
    }
    //qDebug()<<"allPcinfo "<<allPcinfo;
    return allPcinfo;
}
//! [constructor]

//! [onConnected]
void EchoClient::onConnected()
{
    qDebug() << "WebSocket connected";
    connect(&m_webSocket, &QWebSocket::textMessageReceived,
            this, &EchoClient::onTextMessageReceived);
    QString macAddress = getMacAddress();
    m_webSocket.sendTextMessage(macAddress);
}
//! [onConnected]

//! [onTextMessageReceived]
void EchoClient::onTextMessageReceived(QString message)
{
    qDebug() << "Message received:" << message;
    m_webSocket.close();
}

void EchoClient::onClosed()
{
    qDebug() << "Message onClosed:";
}

void EchoClient::onError(QAbstractSocket::SocketError error)
{
   qDebug() << "Message onClosed:"<<error;
}
//! [onTextMessageReceived]
