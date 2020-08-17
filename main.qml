/****************************************************************************
**
** Copyright (C) 2015 Klaralvdalens Datakonsult AB (KDAB).
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt3D module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Scene3D 2.0

//3d lilbraries
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

import QtQuick 2.0 as QQ2

//import javascript functions
import "utility.js" as MyUtils






Item {
    /*
    Text {
        text: "Click me!"
        anchors.top: parent.top
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            anchors.fill: parent
            onClicked: animation.start()
        }
    }
    */



    Text {
        text: "Multisample: " + scene3d.multisample
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            anchors.fill: parent
            onClicked: scene3d.multisample = !scene3d.multisample
        }
    }

    Rectangle
    {
        id: scene
        anchors.fill: parent
        color: "light blue"





        Text{
            id: title
            text: qsTr("OceanGo")
            font.family: "Arial"
            font.pointSize: 30
            color: "black"

            anchors.top:parent.top
            anchors.left:parent.left
            anchors.leftMargin: 875
            anchors.topMargin: 20
        }


        //Dolphin
        AnimatedImage{
            id: gifAnimal
            source:"dolphin.gif"
            Button{
                //anchors.fill: gifAnimal
                id: animalButton
                text: "Learn More"
                onClicked: {
                    gifOcean.visible = false
                    gifAnimal.visible = false
                    title.visible = false
                    gifQuiz.visible = false
                    scene3d.opacity = 0
                    animalButton.visible = 0
                    scene3d1.opacity = 1
                    animalSlide.visible = true
                    zoomer.visible = true
                    zoomerSlide.visible = true

                }

            }
        }





        //Ocean
        AnimatedImage{
            id: gifOcean
            source:"ocean.gif"
            anchors.right: scene.right
            Button{
                id: oceanButton
                anchors.top:gifOcean.top
                anchors.right: gifOcean.right
                text: "Learn More"
                onClicked:{
                    gifOcean.visible = false
                    gifAnimal.visible = false
                    title.visible = false
                    gifQuiz.visible = false
                    scene3d.opacity = 0
                    scene3d2.opacity = 1
                    oceanButton.opacity = 0
                    controlPanel.visible = true
                    specialSlide1.visible = true
                    specialSlide2.visible = true
                    specialSlide3.visible = true
                    specialSlide4.visible = true
                    specialSlide5.visible = true
                    specialSlide6.visible = true
                    specialSlide7.visible = true

                }
            }
        }
        //Quiz
        AnimatedImage{
            id:gifQuiz
            source: "quiz.gif"
            anchors.top: gifOcean.bottom
            anchors.right: scene.right
            anchors.topMargin: 300
            Button{
                id: quizButton
                anchors.top:gifQuiz.top
                anchors.right: gifQuiz.right
                text: "Learn More"
                onClicked:{
                    gifOcean.visible = false
                    gifAnimal.visible = false
                    title.visible = false
                    gifQuiz.visible = false
                    scene3d.opacity = 0
                    oceanButton.opacity = 0

                }
            }
        }


        Rectangle{
            id: controlPanel
            anchors.fill: scene
            anchors.leftMargin: 10
            anchors.topMargin: 10
            anchors.rightMargin: 1650
            anchors.bottomMargin: 10
            color: "light blue"
            visible: false
            Column {
                anchors.fill: controlPanel
                anchors.leftMargin: 5
                anchors.topMargin: 5
                spacing: 10
                Rectangle{
                    id:slidertexscale
                    width:180
                    height: 60
                    color: "#2d2d2d"
                    Text{
                        id: scaletext
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        text: "ROTATION SPEED"
                        color: "white"
                        font{
                            bold: true
                            pointSize: 12
                        }
                    }

                }
                Rectangle {
                    id: slidertexturespeed
                    width: 180
                    height: 60
                    color: "#2d2d2d"
                    Text {
                        id: texturespeedtext
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        text: "ROTATE X"
                        color: "white"
                        font.bold: true
                        font.pointSize: 12
                    }

                }
                Rectangle {
                    id: sliderrotatey
                    width: 180
                    height: 60
                    color: "#2d2d2d"
                    Text {
                        id: roty
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        text: "ZOOM "
                        color: "white"
                        font.bold: true
                        font.pointSize: 12
                    }

                }
                Rectangle {
                    id: slidermeshrotation
                    width: 180
                    height: 60
                    color: "#2d2d2d"
                    Text {
                        id: meshrotationtext
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        text: "ROTATE Y"
                        color: "white"
                        font.bold: true
                        font.pointSize: 12
                    }



                }
                Rectangle {
                    id: slidercycle
                    width: 180
                    height: 60
                    color: "#2d2d2d"
                    Text {
                        id: cyclethroughText
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        text: "CYCLE"
                        color: "white"
                        font.bold: true
                        font.pointSize: 12
                    }



                }
                Rectangle {
                    id: sliderZrotat
                    width: 180
                    height: 60
                    color: "#2d2d2d"
                    Text {
                        id: zrot
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        text: "ROTATE Z"
                        color: "white"
                        font.bold: true
                        font.pointSize: 12
                    }



                }
                Rectangle {
                    id: sliderThick
                    width: 180
                    height: 60
                    color: "#2d2d2d"
                    Text {
                        id: thick
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        text: "THICKNESS"
                        color: "white"
                        font.bold: true
                        font.pointSize: 12
                    }



                }
            }
            Rectangle {
                id: manomet
                width: 500
                x:1350
                y:0
                z:1
                height: 30
                color: "#2d2d2d"
                visible: if(specialSlide5.value <= 20) true; else false
                Text {
                    id: manometid
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    text: "MANOMET HILL"
                    color: "white"
                    font.bold: true
                    font.pointSize: 12
                }
                Image{
                    id:manometImage
                    visible: true
                    anchors.top:parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    source:"manomet.jpg"
                    width:parent.width
                    height:400
                }


            }
            Rectangle {
                id: tauntonRiver
                width: 500
                x:1350
                y:0
                z:1
                height: 30
                color: "#2d2d2d"
                visible: if(specialSlide5.value > 20 && specialSlide5.value < 40) true; else false
                Text {
                    id: pruid
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    text: "Prudence Island"
                    color: "white"
                    font.bold: true
                    font.pointSize: 12
                }
                Image{
                    id:prudencIsland
                    visible: true
                    anchors.top:parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    source:"prudence.jpg"
                    width:parent.width
                    height:400
                }


            }
            Rectangle {
                id: capeElizabeth
                width: 500
                x:1350
                y:0
                z:1
                height: 30
                color: "#2d2d2d"
                visible: if( specialSlide5.value >= 40) true; else false
                Text {
                    id: elisabethid
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 5
                    text: "Cape Elisabeth"
                    color: "white"
                    font.bold: true
                    font.pointSize: 12
                }
                Image{
                    id:elisabethisle
                    visible: true
                    anchors.top:parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    source:"capeElizabeth.jpg"
                    width:parent.width
                    height:400
                }


            }




        }

        //globe
        // Animated Entity
        Scene3D {
            id: scene3d
            anchors.fill: parent
            anchors.margins: 10
            focus: true
            aspects: ["input", "logic"]
            cameraAspectRatioMode: Scene3D.AutomaticAspectRatio

            AnimatedEntity {}

        }




    }
    //
    Scene3D{
        id: scene3d2
        anchors.fill: parent
        anchors.margins: 10
        focus: true
        aspects: ["input", "logic"]
        cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
        opacity: 0
        //CapeEntity{}
        Entity {
            id: sceneRoot


            Camera {
                id: camera
                projectionType: CameraLens.PerspectiveProjection
                fieldOfView: 45
                nearPlane : 0.1
                farPlane : 10000.0
                position: Qt.vector3d( 0.0, 0.0, specialSlide1.value )
                upVector: Qt.vector3d( 0.0, 1.0, 0.0 )
                viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
            }

            FirstPersonCameraController { camera: camera }

            components: [
                RenderSettings {
                    activeFrameGraph: ForwardRenderer {
                        camera: camera
                        clearColor: "transparent"
                    }
                },
                InputSettings { }
            ]

            PhongMaterial {
                id: material
                ambient: "grey"
                diffuse: "light blue"
            }

            //cape
            Mesh{
                id:sphereMesh
                source: if(specialSlide7.value < 50) "cape_blender.obj"; else "cape_fusion.stl"
            }
            //rhode island
            Mesh{
                id:rhodeIsland
                source:if(specialSlide7.value < 50) "ri_thin.stl"; else "ri.stl"
            }
            Mesh{
                id:portland
                source: if(specialSlide7.value < 50) "portland_thin.stl"; else "portland.stl"
            }

            Transform {
                id: sphereTransform
                property real userAngle: 0.0
                matrix: {
                    var m = Qt.matrix4x4();
                    m.rotate(userAngle, Qt.vector3d(specialSlide6.value, specialSlide4.value, specialSlide2.value))
                    //m.translate(Qt.vector3d(20, 0, 0));
                    return m;
                }
            }

            //Landscape




            QQ2.NumberAnimation {
                target: sphereTransform
                property: "userAngle"
                duration: 10000
                from: 0
                to: 360

                loops: QQ2.Animation.Infinite
                running: if(specialSlide3.value < 10 )false; else true
            }
            Entity {
                id: sphereEntity
                components: if(specialSlide5.value >= 20 && specialSlide5.value < 40) [rhodeIsland,material,sphereTransform]; else if(specialSlide5.value>= 40)[portland,material, sphereTransform]; else [sphereMesh,material,sphereTransform];
                //components: [ rhodeIsland, material, sphereTransform ]
            }
        }



    }
    //accomponying sliders
    //zoom
    Slider {
        id: specialSlide1
        visible: false
        from: 50
        value: 25
        to: 0
        x: 5
        y: 180
        z: 1
    }
    //rotation x
    Slider{
        id: specialSlide2
        visible: false
        from: 0
        value: 0.5
        to: 1
        x: 5
        y: 110
        z: 1
    }
    //revolution
    Slider{
        id: specialSlide3
        visible: false
        from: 1
        value: 25
        to: 50
        x: 5
        y: 40
        z: 1
    }
    Slider {
        id: specialSlide4
        visible: false
        from: 0
        value: 0.5
        to: 1
        x: 5
        y: 250
        z: 1
    }
    //cycle through the models
    Slider {
        id: specialSlide5
        visible: false
        from: 0
        value: 0
        to: 50
        x: 5
        y: 320
        z: 1
    }
    Slider {
        id: specialSlide6
        visible: false
        from: 0
        value: 0
        to: 100
        x: 5
        y: 390
        z: 1
    }
    Slider {
        id: specialSlide7
        visible: false
        from: 1
        value: 1
        to: 100
        x: 5
        y: 460
        z: 1
    }
    Slider {
        id: animalSlide
        visible: false
        from: 1
        value: 1
        to: 100
        x: 800
        y: 800
        z: 1
    }
    Slider {
        id: zoomerSlide
        visible: false
        from: 500
        value: 50
        to: 1
        x: 0
        y: 20
        z: 1
    }

    Rectangle {
        id: zoomer
        width: 200
        height: 60
        color: "#2d2d2d"
        visible: false
        Text {
            id: zoomerc
            text: "ZOOM "
            color: "white"
            font.bold: true
            font.pointSize: 12
            x:85
        }

    }
    Scene3D {
        id: scene3d1
        anchors.fill: parent
        anchors.margins: 10
        focus: true
        aspects: ["input", "logic"]
        cameraAspectRatioMode: Scene3D.AutomaticAspectRatio
        opacity:0

        Entity {
            id: sceneRoot1

            Camera {
                id: camera1
                projectionType: CameraLens.PerspectiveProjection
                fieldOfView: 45
                nearPlane : 0.1
                farPlane : 1000.0
                position: Qt.vector3d( 0.0, 0.0, zoomerSlide.value )
                upVector: Qt.vector3d( 0.0, 0.0, 0.0 )
                viewCenter: Qt.vector3d( 0.0, 0.0, 0.0 )
            }

            FirstPersonCameraController { camera: camera }

            components: [
                RenderSettings {
                    activeFrameGraph: ForwardRenderer {
                        camera: camera1
                        clearColor: "transparent"
                    }
                },
                InputSettings { }
            ]

            PhongMaterial {
                id: material1
                ambient: "dark grey"
                diffuse: "white"
            }
            /*
            SphereMesh {
                id: sphereMesh1
                radius: 3
                //visible:false
            }
            */
            Mesh{
                id:sphereMesh1
                source:if(animalSlide.value < 20) "Dolphin.obj"; else if(animalSlide.value >20 && animalSlide.value < 40) "Shark.obj"; else if(animalSlide.value >= 40 && animalSlide.value < 60) "SpermWhaleLowPoly.obj"; else "bamboo shark.obj"
            }

            Transform {
                id: sphereTransform1
                property real userAngle: 0.0
                matrix: {
                    var m = Qt.matrix4x4();
                    m.rotate(userAngle, Qt.vector3d(0, 1, 0))
                    //m.translate(Qt.vector3d(20, 0, 0));
                    return m;
                }
            }

            //Landscape




            QQ2.NumberAnimation {
                target: sphereTransform1
                property: "userAngle"
                duration: 10000
                from: 0
                to: 360

                loops: QQ2.Animation.Infinite
                running: true
            }
            Entity {
                id: sphereEntity1
                components: [ sphereMesh1, material1, sphereTransform1 ]
            }
        }

    }
    Button{
        //anchors.fill: gifAnimal
        id: home1
        text: "Home"
        x: 1250
        y:0
        z:2
        onClicked: {
            gifOcean.visible = true
            gifAnimal.visible = true
            title.visible = true
            gifQuiz.visible = true
            scene3d.opacity = 1
            animalButton.visible = true
            scene3d1.opacity = 0
            scene3d2.opacity = 0
            animalSlide.visible = false
            zoomer.visible = false
            zoomerSlide.visible = false
            specialSlide1.visible = false
            specialSlide2.visible = false
            specialSlide3.visible = false
            specialSlide4.visible = false
            specialSlide5.visible = false
            specialSlide6.visible = false
            specialSlide7.visible = false
            capeElizabeth.visible = false
            tauntonRiver.visible = false
            manomet.visible = false
            controlPanel.visible = false
            oceanButton.visible = true


        }

    }


}






























