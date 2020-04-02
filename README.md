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

## The first level

Now that you have prepared the necessary objects, you can build a first level just to play around in.

Open _levels/001.tscn_ in the _FileSystem_ tab. This is a level with just one base `Node2D` that has been named `World`.

From the _Filesystem_ tab _objects_ folder, drag a couple of blocks and balls into the 2D view. Remember to place them within the thin blue outline that shows the _camera viewport_. Otherwise they will be off-screen.

Now click _Play Scene_ in the top right part of the window, or press <kbd>F6</kbd> to start the current level.

If everything went alright, you'll see the placed objects drop out of view. This shows that gravity works.

Of course, this is rather boring.

### Static body physics

Since you want something to build on, you need to learn a second type of physics engine body. The static body has the same collision behaviour as the rigid body, but it cannot move. This is the ideal type of object to use for the fixed parts of your world.

Click the `World` in the _Scene_ tab and add a `StaticBody2D`.  Rename this `StaticBody2D` to `Ground` just to easily identify it.
Drag the `Ground` down to the bottom of the camera viewport. It doesn't matter that it won't exactly snap to that line.

Add a `CollisionShape2D` to the `Ground`. Then in the _Inspector_ tab, click the _Shape_ `[empty]` and select _New RectangleShape2D_. Grab a corner the blue square that has appeared in the view and drag to widen it so that the rectangle covers at least the bottom of the camera viewport.

Now press _Play Scene_ again and see what happens. If everything went well, the falling objects should have stopped just above the bottom of the screen.

However, it is a bit weird that the ground is essentially invisible. To remedy that, click the `Ground` in the _Scene_ tab and add a `ColorRect`. It should appear as a white square below the ground line in the 2D view. Move and resize it so it covers the blue rectangle that indicates the collision shape. For some added flair, click the _Color_ property in the _Inspector_ tab and pick a colour of your choice.

When you now _Play Scene_ again, you should see your rigid bodies fall down onto the coloured ground.

### Building time

Drag objects into the 2D view and build something by stacking them. You should enable _smart snapping_ to allow the blocks to snap correctly to the half-way points in the grid. Pay attention that when have placed a block, you click the background to deselect it before you drag the next object in. Otherwise you might attach objects to each other, and that can give unexpected behaviour.
