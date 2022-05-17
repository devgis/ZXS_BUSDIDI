<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bus.aspx.cs" Inherits="Bus_Start.bus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>公交信息导出</title>
   <script src="http://api.map.baidu.com/api?v=1.3" type="text/javascript"></script> <%--该接口有用2.0的没用--%>
     <style type="text/css">
      #form1 { width: 100%;  height: 100%; float: none;/*border-right: 2px solid #bcbcbc;*/
        }

        #allmap { width: 100%;height:270px; margin: 0; font-family: "微软雅黑"; text-align: left;float:left
         }
         #search { width: 100%;height:40px; margin: 0; font-family: "微软雅黑"; text-align: center;
float:left
         }
        #left_show { width:50%;height:320px;  float:left;
        }
        #right_show { width:50%;height:320px; float:left;
             text-align: left;
         }

      </style>
</head>
<body>
    <form id="form1" runat="server">
         <div id="allmap">    
         </div>
        <div id="search">    
            <input id="busId" type="text" /><input id="btn-search" type="button" value="确认查询" /></div>
         <div id="left_show"> 
           
             </div>
         <div id="right_show"> 
             
         </div>
     
         </form>
</body>
</html>
   <script type="text/javascript" >
       // 百度地图API功能
       var map = new BMap.Map("allmap");
       map.centerAndZoom(new BMap.Point(120.9029, 31.9747), 12);
       //var point = new BMap.Point(116.404, 39.915);//map.centerAndZoom(point, 15);
       map.setDefaultCursor("crosshair");//设置地图默认的鼠标指针样式
       map.addControl(new BMap.OverviewMapControl());
       map.enableDragging(); //启用地图拖拽事件，默认启用(可不写)
       map.enableScrollWheelZoom(); //启用地图滚轮放大缩小
       map.enableDoubleClickZoom(); //启用鼠标双击放大，默认启用(可不写)
       map.enableKeyboard(); //启用键盘上下左右键移动地
      


          
      
       var tempVar;
       var busline = new BMap.BusLineSearch(map, {
           renderOptions: { map: map, panel: "left_show" },
           onGetBusListComplete: function (result) {
               if (result) {
                   tempVar = result;//此时的结果并不包含坐标信息，所以getCoordinate函数不能在此调用。
                   //通过跟踪变量，坐标是在onGetBusListComplete之后才被百度的包添加进来的
                    
                   var fstLine = result.getBusListItem(1);//获取第一个公交列表显示到map上
                   busline.getBusLine(fstLine);

               }
           },
          onBusLineHtmlSet: function () {
               try {
                  
                   getCoordinate(tempVar['1']);//获取反向行驶的名称id 将result.getBusListItem(0)，tempVar['0']中“0”换成“1”

               } catch (e) {
               }
           }

       });
       function getCoordinate(result) {
           var right_show = document.getElementById("right_show");
           var stations = result._stations;
        
           var html = [];
           stations.forEach(function (item) {
               html.push('<li>' + item.name + ' ' + item.position.lng + ' ' + item.position.lat + '</li>');
           });
           
           right_show.innerHTML = '<ol>' + html.join('') + '</ol>';
           

          


                 
       }


       document.getElementById('btn-search').onclick = function () {
           busline.getBusList(document.getElementById("busId").value);
       }



       function busSearch() {
           busline.getBusList(document.getElementById("busId").value);
         
       }
       setTimeout(function () {
           busSearch();
       }, 1500);


                 </script>
