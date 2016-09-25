app.controller('dashboardCtrl', function($scope,$location){
// Load Charts and the corechart and barchart packages.
      // Load Charts and the corechart and barchart packages.
      var datos = [[1,2,3,4,5],[5,4,3,2,1],[10,5,4,3,2],[2,3,4,5,10],[20,2,3,10,1],[2,3,4,5,6,7],[10,5,1]];
      google.charts.load('current', {'packages':['corechart']});

      // Draw the pie chart and bar chart when Charts is loaded.
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data1 = new google.visualization.DataTable();
        data1.addColumn('string', 'Respuestas');
        data1.addColumn('number', 'Cifras');
        data1.addRows([
          ['Respuesta 1', datos[0][0]],
          ['Respuesta 2', datos[0][1]],
          ['Respuesta 3', datos[0][2]],
          ['Respuesta 4', datos[0][3]],
          ['Respuesta 5', datos[0][4]]
        ]);

        var piechart1_options = {title:'Estadísticas. Encuesta, pregunta 1',
                       width:400,
                       height:300};
        var piechart1 = new google.visualization.PieChart(document.getElementById('piechart1_div'));
        piechart1.draw(data1, piechart1_options);
//---------------------------------------------------------------------------------------------------
        var data2 = new google.visualization.DataTable();
        data2.addColumn('string', 'Respuestas');
        data2.addColumn('number', 'Cifras');
        data2.addRows([
          ['Respuesta 1', datos[1][0]],
          ['Respuesta 2', datos[1][1]],
          ['Respuesta 3', datos[1][2]],
          ['Respuesta 4', datos[1][3]],
          ['Respuesta 5', datos[1][4]]
        ]);

        var piechart2_options = {title:'Estadísticas. Encuesta, pregunta 2',
                       width:400,
                       height:300};
        var piechart2 = new google.visualization.PieChart(document.getElementById('piechart2_div'));
        piechart2.draw(data2, piechart2_options);

        //---------------------------------------------------------------------------------------------------
        var data3 = new google.visualization.DataTable();
        data3.addColumn('string', 'Respuestas');
        data3.addColumn('number', 'Cifras');
        data3.addRows([
          ['Respuesta 1', datos[2][0]],
          ['Respuesta 2', datos[2][1]],
          ['Respuesta 3', datos[2][2]],
          ['Respuesta 4', datos[2][3]],
          ['Respuesta 5', datos[2][4]]
        ]);

        var piechart3_options = {title:'Estadísticas. Encuesta, pregunta 3',
                       width:400,
                       height:300};
        var piechart3 = new google.visualization.PieChart(document.getElementById('piechart3_div'));
        piechart3.draw(data3, piechart3_options);

        //---------------------------------------------------------------------------------------------------
        var data4 = new google.visualization.DataTable();
        data4.addColumn('string', 'Respuestas');
        data4.addColumn('number', 'Cifras');
        data4.addRows([
          ['Respuesta 1', datos[3][0]],
          ['Respuesta 2', datos[3][1]],
          ['Respuesta 3', datos[3][2]],
          ['Respuesta 4', datos[3][3]],
          ['Respuesta 5', datos[3][4]]
        ]);

        var piechart4_options = {title:'Estadísticas. Encuesta, pregunta 4',
                       width:400,
                       height:300};
        var piechart4 = new google.visualization.PieChart(document.getElementById('piechart4_div'));
        piechart4.draw(data4, piechart4_options);
        //---------------------------------------------------------------------------------------------------
        var data5 = new google.visualization.DataTable();
        data5.addColumn('string', 'Respuestas');
        data5.addColumn('number', 'Cifras');
        data5.addRows([
          ['Respuesta 1', datos[4][0]],
          ['Respuesta 2', datos[4][1]],
          ['Respuesta 3', datos[4][2]],
          ['Respuesta 4', datos[4][3]],
          ['Respuesta 5', datos[4][4]]
        ]);

        var piechart5_options = {title:'Estadísticas. Encuesta, pregunta 5',
                       width:400,
                       height:300};
        var piechart5 = new google.visualization.PieChart(document.getElementById('piechart5_div'));
        piechart5.draw(data5, piechart5_options);
//-------------------------------------------------------------------------------------
        var data6 = new google.visualization.DataTable();
        data6.addColumn('string', 'Edades');
        data6.addColumn('number', 'Cifras');
        data6.addRows([
          ['De 12 a 17', datos[5][0]],
          ['De 18 a 33', datos[5][1]],
          ['De 34 a 45', datos[5][2]],
          ['De 46 a 55', datos[5][3]],
          ['De 65 a 73', datos[5][4]],
          ['Más de 74', datos[5][5]]
        ]);

        var piechart6_options = {title:'Estadísticas. Encuesta, por rango de edades',
                       width:400,
                       height:300};
        var piechart6 = new google.visualization.PieChart(document.getElementById('piechart6_div'));
        piechart6.draw(data6, piechart6_options);
        //-------------------------------------------------------------------------------------
        var data7 = new google.visualization.DataTable();
        data7.addColumn('string', 'Género');
        data7.addColumn('number', 'Cifras');
        data7.addRows([
          ['Hombres', datos[6][0]],
          ['Mujeres', datos[6][1]],
          ['No Indica', datos[6][2]]
        ]);

        var piechart7_options = {title:'Estadísticas. Encuesta, género',
                       width:400,
                       height:300};
        var piechart7 = new google.visualization.PieChart(document.getElementById('piechart7_div'));
        piechart7.draw(data7, piechart7_options);
      }

      $scope.init = function(){
          datos = [[1,2,3,4,5],[5,4,3,2,1],[10,5,4,3,2],[2,3,4,5,10],[20,2,3,10,1],[2,3,4,5,6,7],[10,5,1]];
          $scope.pyme = {
            nombreComercial: "MiPYME",
            urlFacebook: "fb.com/miPYME"
          }
          console.log("Iniciado");
      }

});