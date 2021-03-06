# Cleaning Up a Horrible Mesh

I just went through an agonizing evening trying to get my [Infinity Gauntlet][] workable.

[Infinity Gauntlet]: 2s3yy-78sq8-v79dk-zfbfy-3n1cv

What I ended up doing was taking the model, rocking back and forth between a couple of filters until the whole thing was forced manifold, and then doing a simplification (which just cleaned up the model's reckless points into a nice, normal shape that could be interacted with better in OpenSCAD).

I still had to run it through Blender's 3D PRinting Workbench or whatever the addon is called to put the finishing touch on it, though. (Note: I really ought to figure out Blender.)

Making the note here that the bit in OpenSCAD about manifold issues, the link to Wikibooks, should be revised for the latest version of MeshLab

## A defined procedure

Because I'm going through this again with the new model: the first thing to do is run "Split Vertexes Incident on Non Manifold Edges" - this will take care of the low-hanging fruit

continue rerunning "Split Vertexes" until everything is split

then "Remove Isolated Folded Faces by Edge Flip"

(may need to rerun Split Vertexes here?)

okay anyway, I just ran a quadratic simplification on this a couple times, and now I've got both issues. From the top, here's how I'm fixing them:

Split Vertexes Incident on Non Manifold Edges -> Remove Faces from Non Manifold Edges ->
Split Vertexes Incident on Non Manifold Edges, then Re-orient All Faces Coherently for good measure (which did make a few tweaks)

okay, new run...

I think what I'm doing now is the Split -> Remove Faces -> Split cycle until there are no more faces, then doing Split -> Remove T-Vertices by Edge Flip or whatever at a high enough ratio that the program doesn't crash, then repeating into Split Vertices -> Remove Duplicate Faces -> Remove Isolated Folded Faces -> Remove Faces from Non Manifold Edges (takes care of business)

okay, so, from what I think is the scratch model, the routine I seem to be following that works *without* biting chunks out of the model (a symptom I saw with an earlier round of simplification without really ironing out the duplicate-vertex/T-vertex kinks of the original):

LABEL START: Remove duplicate vertices.

Split incident, repeat until everything's split to eliminate all non-manifold vertices.

when there are non-manifold edges (which there probably won't be on import), Remove Duplicate Faces -> Remove Isolated Folded Faces -> Remove Faces from Non Manifold Edges should finally take the number down to zero (the last is saved for last because it's believed that running the first two simplifications will make the last one more reliable)

Run a smaller Remove T-Vertices by Edge Flip than the one that you were able to run without crashing last time. This whole process is about winnowing the geometry for this step (higher ratios are safer)

Goto LABEL START: Remove duplicate vertices. With the changes made by Remove T-Vertices, this will lead you to a model with some non-manifold edges as well as non-manifold vertices. Splitting non-manifold vertices down to 0 won't affect these, but it'll make the geometry less crashy for the next step, where you remove all the non-manifold edges.

I'm throwing in another Remove Duplicated Vertices here, even though we've already got non-manifold vertices to split, just to ensure everything's getting caught in the repeated-split step that can be.

Okay, after reaching the point where I could do a Remove By Edge Flip at 40, I'm trying a Remove T-Vertices by Edge Collapse, and realizing that Ratio might go the other way for this one's performance, because it gets rid of a ton at 40

Remove Duplicate Faces works directly after the Remove T-Vertices, giving 0 duplicate vertices

Okay, this is getting hairy... I think I'm going to go back to the "being able to winnow edge flip" strategy.

Back in that groove, I can start fixing thousands of vertices with a ratio of 20

No, okay, looking at the model as I do this, this is just chewing up the model. Removing t-vertices at low ratios messes up geometry. And it's not bringing me any closer to being able to do a remeshing.

## back from scratch

Okay, so, really it was just a matter of keeping "Planar Simplification" on when trying to simplify - otherwise, the way-too-high-res spheres just go completely glitchy in processing

okay, and now the resmoothed model isn't manifold... time to go to town on it

Okay, so, starting over: to make sure that chunks won't get dented in remeshing, Re-orient All Faces Coherently and Normalize Face Normals (I think the orientation filter normalizes the vertex normals).

Okay, I've got something working here - turning on Preserve Topology and Preserve Normals also helps when running the simplificiation. I think a big important thing to note is that the default ratio when splitting vertices really shouldn't be 0, because that's the one value that doesn't survive "remove duplicate vertices". like the default value could have been .0001

this can be another winnowing technique: Remove Duplicate Vertices and try a larger value until you get 0 duplicate vertices

okay... I'm not really sure I can figure out how to avert certain dents in simplification? but I ran the simplification going to 200K faces, and this works for me
