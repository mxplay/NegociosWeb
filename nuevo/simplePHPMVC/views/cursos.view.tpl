<!-- Nav -->
<nav id="nav">
  <ul>
    <li class="current"><a href="index.php?page=menup">Inicio</a></li>
    <li><a href="index.php?page=visionymision">Vision y Mision</a></li>
    <li>
      <a href="index.php?page=oferta">Oferta Academica</a>
      <ul>
        <li><a href="index.php?page=primaria">Primaria</a></li>
        <li><a href="index.php?page=secundaria">Secundaria</a></li>
        <li><a href="index.php?page=bachillerato">Bachillerato</a></li>
      </ul>
    </li>
    <li><a href="index.php?page=actividades">Actividades</a></li>
    <li><a href="">Director</a></li>
  </ul>
</nav>
</div>
</div>
<!-- Main -->
<div class="wrapper style2">
  <div class="title">Control De Cursos </div>
  <div id="main" class="container">
    <!-- Content -->
    <div id="content">
      <article class="box post">
        <header class="style1">
          <h2>Gestione La Informacion De Los Curso<br class="mobile-hide" />
          </h2>
        </header>
        </div>
        <form id = "frmData" action="cursos.control.php"
              method="post">
              <input type="hidden" name="selid"
                  value="<?php echo $selid; ?>"
                  />
              <input type="hidden" name="selborr"
                      value="<?php echo $selborr; ?>"
                   />
                   <table>
                     <tr>
                       <td>
                           <label>Nombre Del Curso: </label>
                       </td>
                       <td>
                         <input type="text"
                                 name="txtNom"
                                 id="txtNom"
                                  value=""/>
                       </td>
                     </tr>
                     <tr>
                       <td>
                         <label>Nivel</label>
                       </td>
                       <td>
                         <select name="NivelCmb">
                             <option value="Primaria">
                                 Primaria
                             </option>
                             <option value="Secundaria">
                                 Secundaria
                             </option>
                             <option value="Bachillerato" >
                                 Bachillerato
                             </option>
                         </select>
                       </td>
                     </tr>
<tr>
  <td>
    <ul class="actions">
      <li> <input type="submit"
          value="Guardar"
          name="btnSave"/></li>
          <li><input type="submit"
              value="Eliminar"
              name="btnDelete"/></li>
              <li><input type="submit"
                  value="Actualizar"
                  name="btnUpdate"/></li>
    </ul>
  </td>
</tr>

  </table>
          </form>

      </article>
    </div>
  </div>
</div>
