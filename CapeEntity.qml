import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Scene3D 2.0

//3d lilbraries
import Qt3D.Core 2.0
import Qt3D.Render 2.0
import Qt3D.Input 2.0
import Qt3D.Extras 2.0

import QtQuick 2.0 as QQ2


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
        source: "cape_fusion.stl"
    }
    //rhode island
    Mesh{
        id:rhodeIsland
        source:"ri.stl"
    }

    Transform {
        id: sphereTransform
        property real userAngle: 0.0
        matrix: {
            var m = Qt.matrix4x4();
            m.rotate(userAngle, Qt.vector3d(0, 1, specialSlide2.value))
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
        components: [ sphereMesh, material, sphereTransform ]
    }
    //accomponying sliders
    //zoom
    Slider {
        id: specialSlide1
        visible: false
        from: 1
        value: 20
        to: 50
        x: 5
        y: 180
        z: 1
    }
    //rotation
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
}




