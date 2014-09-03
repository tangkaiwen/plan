<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>自由拖动的DIV层方块</title>
    <script src="js/jquery-1.8.3.min.js"></script>
    <meta http-equiv="content-type" content="text/html;charset=gb2312">
    <style type="text/css">
        /*#draggable { background-color: green; font-size: 9pt; padding: 30px; color: white; width: 360px; height: 224px; position: absolute; }*/
        #dragbox { width: 360px; height: 224px; background-color: green; position: fixed; cursor: move; }
    </style>
    <script type="text/javascript">
        var rDrag = {
            o: null,
            init: function (o) {
                o.onmousedown = this.start;
            },
            start: function (e) {
                var o;
                e = rDrag.fixEvent(e);
                e.preventDefault && e.preventDefault();
                rDrag.o = o = this;
                o.x = e.clientX - rDrag.o.offsetLeft;
                o.y = e.clientY - rDrag.o.offsetTop;
                document.onmousemove = rDrag.move;
                document.onmouseup = rDrag.end;
            },
            move: function (e) {
                e = rDrag.fixEvent(e);
                var oLeft, oTop;
                oLeft = e.clientX - rDrag.o.x;
                oTop = e.clientY - rDrag.o.y;
                rDrag.o.style.left = oLeft + 'px';
                rDrag.o.style.top = oTop + 'px';
            },
            end: function (e) {
                e = rDrag.fixEvent(e);
                rDrag.o = document.onmousemove = document.onmouseup = null;
            },
            fixEvent: function (e) {
                if (!e) {
                    e = window.event;
                    e.target = e.srcElement;
                    e.layerX = e.offsetX;
                    e.layerY = e.offsetY;
                }
                return e;
            }
        }
        window.onload = function () {
            //   var obj = document.getElementById('dragbox');
            // var obj = document.getElementsByClassName('dragbox');
            rDrag.init($("#dragbox"));
        }
</script>
</head>
<body>
    <div id="dragbox" class="dragbox">这个可以拖动！</div>
</body>
</html>
