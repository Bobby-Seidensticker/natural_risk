
import 'dart:html';
import 'dart:math' as math;

void main() {
  CanvasElement c = query('canvas');
  drawBase(c);
}

void drawBase(c) {
  CanvasRenderingContext2D ctx = c.getContext('2d');
  ctx.lineWidth = 2;
  ctx.beginPath();
  num x, y, odd;
  num size = 20;
  num sin = math.sin(math.PI / 3) * size;
  num cos = math.cos(math.PI / 3) * size;
  String fill;
  window.console.log('sin: $sin, cos: $cos');
  
  var map = ['nnbbbbbbbb',
             'nbbbbbbbbb',
             'bccccccccb',
             'bccccccccb',
             'bccccccccb',
             'bccccccccb',
             'bbbbbbbbbb'
             ];
  
  for (num j = 0; j < map.length; j++) {
    for (num i = 0; i < map[j].length; i++) {
      if (map[j][i] == 'b') {
        fill = '#000000';
      } else if (map[j][i] == 'c') {
        fill = '';
      } else {
        continue;
      }
      if (j % 2 == 0) {
        x = cos * 5 +
            i * 3 * size;
        y = (j / 2) * sin * 2;
      } else {
        x = 2 * cos +
            i * 3 * size;
        
        y = sin +
            (j / 2).floor() * 2 * sin;
      }
      drawHexagon(ctx, x, y, size, fill);
    }
  }
  ctx.stroke();
}

void drawHexagon(CanvasRenderingContext2D ctx, num x, num y, int size, String fill) {
  num c = math.cos(math.PI / 3);
  num s = math.sin(math.PI / 3);
  ctx.beginPath();
  ctx.moveTo(x, y);
  x += size;
  ctx.lineTo(x, y);
  //window.console.log('x: $x, y: $y');
  x += size * c;
  y += size * s;
  ctx.lineTo(x, y);
  //window.console.log('x: $x, y: $y');
  x -= size * c;
  y += size * s;
  ctx.lineTo(x, y);
  //window.console.log('x: $x, y: $y');
  x -= size;
  ctx.lineTo(x, y);;
  //window.console.log('x: $x, y: $y');
  x -= size * c;
  y -= size * s;
  ctx.lineTo(x, y);
  //window.console.log('x: $x, y: $y');
  x += size * c;
  y -= size * s;
  ctx.lineTo(x, y);
  //window.console.log('x: $x, y: $y');
  ctx.closePath();
  ctx.stroke();
  if (fill != '') {
    ctx.fillStyle = fill;
    ctx.fill();
  }
}
