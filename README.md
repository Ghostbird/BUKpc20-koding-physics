# Godot Physics Engine tutorial

In this tutorial you're going to learn how to make use of the Godot physics engine to build a game while writing very little code. The physics engine is the part of Godot that makes a certain kind of objects behave according to the rules of physics in the game world. This enables us to make things fall down, and touch each other, without writing any code.

## Requirements

For this tutorial you need a computer with the Godot Engine installed. You can use the [Godot Engine on Steam](https://store.steampowered.com/app/404790/Godot_Engine/), or you can download it directly from the [Godot website](https://godotengine.org/).

## Getting started

Next you're going to have to download this project's [start point](https://github.com/Ghostbird/BUKpc20-koding-physics/archive/0-getting-started.zip). Extract the ZIP somewhere on you computer.

Now open Godot and select `Import`. ![import instructions](docs/01-import.png)

Select the path where you extracted the ZIP, click the `project.godot`, then select `Import & Edit`.

## Rigid body physics

Rigid body physics is a name for the behaviour that you would expect a hard, solid object to have in the real world. In the project, a few rigid bodies have already been prepared.

In the left bottom part of the Godot window is the _FileSystem_ tab. Open the folder _objects_ and open _block-square.tscn_.

In the _Scene_ tab on the left you can now see that a square block object is a `RigidBody2D` that has a `Sprite` and a `CollisionShape2D`. The sprite is the picture that makes the rigid body visible. The collision shape has been made invisible. Click the closed eye icon to the right of `CollisionShape2D` to show the blue collision shape overlay.

As you can see the collision shape closely matches the shape of the picture. This makes the behaviour as realistic as possible. Click the now opened eye icon again to hide the collision shape.

In the _Scene_ tab, click `RigidBody2D`. Now to the right at the _Inspector_ tab. You can see that the _Mass_ of the square block is set to 1.

Now in the _Filesystem_ tab open the _block_horizontal.tscn_. You'll see that it has the same structure as the square block, but a different picture and shape. In fact it is the size of two square blocks. Click `RigidBody2D` here, and look at the _Mass_. It has been set to 2. This means that it will behave exactly twice as heavy as the square block.

To us this makes perfect sense, but this is one step that you must not forget when you create your own rigid bodies. Godot cannot know that you want this object to be twice as heavy as the other, simply because it is twice as big. It could very well be that one was made of stone and the other of wood.

### Add a ball

Now you'll create your own rigid body. In the top left corner of Godot, click _Scene_ » _New Scene_. In the new scene on the left side, click `+ Other Node`. Select `RigidBody2D` and click `Create`.

Next click the `+` icon to add a child node or press <kbd>Ctrl</kbd><kbd>A</kbd>. Select `Sprite` and click `Create`.

In the _Inspector_ tab to the left, you'll see that _Texture_ is `[empty]`. In the bottom-left _FileSystem_ tab, open the _assets_ folder and click and drag `ball.png` onto the `[empty]` value after _Texture_. Now you should see a huge ball in the central scene view.

Grab one of the corners of the ball image and drag it while holding <kbd>Shift</kbd>, to resize it to a square that is two by two grid tiles in size. Then reposition the sprite so the centre cross is on the intersection of the coloured axes. ![Ball scaled and positioned](docs/02-ball.png)

Now you have the image of the ball in place. However, there's still a yellow alert icon after the `RigidBody2D` in the _Scene_ tab. That is because you have specified how the object looks, but not yet how it is shaped.

Click the `RigidBody2D` in the _Scene_ tab. Add a child node. Select `CollisionShape2D` and click `Create`. Look at the _Inspector_ tab to the right. You'll see that the _Shape_ is `[empty]`. Click it and select _New CircleShape2D_. You'll see a small blue dot in the centre of your ball. Grab the orange point and drag it so the blue area exactly covers the picture of the ball.

Now you don't need to see the collision area any more, so in the _Scene_ tab, click the icon after `CollisionShape2D` to hide the blue overlay.

Finally save this file in the _objects_ folder as _ball.tscn_.
