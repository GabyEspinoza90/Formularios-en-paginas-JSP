<%@page import="java.lang.String"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="beans.alumno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calificaciones Alumno</title>
         <link rel="stylesheet" href="estiloccs.css">
    </head>
<body>
<%!
 alumno Alumno[] = new alumno[30];
 int cont=0;
%>

        <h1> Tabla de Alumnos </h1>
        <form id="datos" action="index.jsp" method="POST">
            <table>
                <thead>
                    <tr>
                        <th>Matricula</th>
                        <th>Nombre</th>
                        <th>Apellidos</th>
                        <th>DDI</th>
                        <th>DWI</th>
                        <th>ECBD</th> 
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="text" name="tfMatricula" value="" size="11" maxlength="11"/></td>
                        <td><input type="text" name="tfNombre" value="" size="15"                  /></td>
                        <td><input type="text" name="tfApellidos" value="" size="30"               /></td>
                        <td><input type="text" name="tfDdi" value="" size="2"                      /></td>
                        <td><input type="text" name="tfDwi" value="" size="2"                      /></td>
                        <td><input type="text" name="tfEcbd" value="" size="2"                     /></td>
                        <td><input type="submit" name="btnRegistrar" value="Registrar"             /></td>  
                    </tr>
                </tbody>
            </table>
        </form>  
        <br>
        <br> 
      <%
            if(request.getParameter("btnRegistrar")!=null)
                
            {
                Alumno[cont]=new alumno();
                
                Alumno[cont].setMatricula(request.getParameter("tfMatricula"));
                Alumno[cont].setNombre(request.getParameter("tfNombre"));
                Alumno[cont].setApellidos(request.getParameter("tfApellidos"));
                Alumno[cont].setDdi(Integer.parseInt(request.getParameter("tfDdi")));
                Alumno[cont].setDwi(Integer.parseInt(request.getParameter("tfDwi")));
                Alumno[cont].setEcbd(Integer.parseInt(request.getParameter("tfEcbd")));
                Alumno[cont].calcularProm();
                
                //matricula= request.getParameter("tfMatricula");
                //nombre=request.getParameter("tfNombre");
                //apellidos=request.getParameter("tfApellidos");
                //ddi=Integer.parseInt(request.getParameter("tfDdi"));
                //dwi=Integer.parseInt(request.getParameter("tfDwi"));
                //ecbd=Integer.parseInt(request.getParameter("tfEcbd"));
                 
                 cont++;
                 
                 //prom=(ddi+dwi+ecbd)/3.0;
                //prom = Math.round(prom*100.0)/100.0;
                
                //DecimalFormat df=new DecimalFormat("#.00");
                //prom=Double.parseDouble(df.format(prom));
                /*out.println("Matricula:" + matricula + "<br>"
                        + "Nombre:" + nombre + apellidos + "<br>"
                        + "DDI:" + ddi + "<br>"
                        + "DWI:" + dwi + "<br>"
                        + "ECBD" + ecbd + "<br>"
                        + "Promedio" +prom);*/     
            }
        %>
        
            <table border="1" align="center">  
            <thead>
                <tr>
                    <th>MATRICULA</th>
                    <th>NOMBRE COMPLETO</th>
                    <th>DDI</th>
                    <th>DWI</th>
                    <th>ECBD</th>
                    <th>PROM</th>
                </tr>
            </thead>
            <%for (int i=0;i<cont;i++)
          {%>
            <tbody >
                <tr>
                 <td> <%=Alumno[i].getMatricula()%></td>
                 
                 <td> <%=Alumno[i].getNombre()%>&nbsp;<%= Alumno[i].getApellidos()%> </td> 
                 <td> <%=Alumno[i].getDdi()%></td>
                 <td> <%=Alumno[i].getDwi()%></td>
                 <td> <%=Alumno[i].getEcbd()%></td>
                 <td> <%=Alumno[i].calcularProm()%></td>
               </tr>
            </tbody>
         <% } %>
        </table> 
    <footer id="footer">
    &copy;Todos los derechos reservados
    </footer>          
</body>
</html>
    

