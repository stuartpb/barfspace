# Controlling Misty

Prototyped a controller from http://sdk.mistyrobotics.com/command-center/index.html by dragging the image of the head (for rolling) up to the same level as a section heading and running this in console:

```js
function setHeadToCursor(evt) {
  const fx = evt.layerX / evt.target.width * 2 - 1;
  const fy = evt.layerY / evt.target.height * 2 - 1;
  const yawLimit = 90;
  const pitchLimit = 45;
  evt.preventDefault();
  return fetch('http://192.168.0.117/api/head',{method:'POST',body:JSON.stringify({pitch:fy*pitchLimit,yaw:fx*pitchLimit,roll:0,duration:0})});
}
$0.addEventListener('mousedown',(evt)=>if(evt.button==0)setHeadToCursor(evt));
$0.addEventListener('mousemove',(evt)=>if(evt.buttons&1)setHeadToCursor(evt));
```
