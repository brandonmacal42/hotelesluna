import { useEmpleadoContext } from "../../context/EmpleadoContext";
import ListaContainer from "../../components/layout/ListaContainer";

const ListaComidas = () => {
  const { comidas } = useEmpleadoContext();

  return (
    <ListaContainer title="Lista de Comidas">
      <ul>
        {comidas.map((r) => (
          <li key={r.idempleado} className="border-b last:border-none py-2">
            <strong>
              {r.nombre} {r.apellidop} {r.apellidom}
            </strong>
            <br />
            Hotel: {r.idhotel} <br />
            Calle: {r.calle}, Interior: {r.numerointerior}, Exterior:{" "}
            {r.numeroexterior} <br />
            Colonia: {r.colonia}, Estado: {r.estado} <br />
            Horario: {r.horario} <br />
            Fecha de Nacimiento: {r.fechanacimiento} <br />
            Fecha de Contratación: {r.fechacontratacion} <br />
            Género: {r.genero} <br />
            RFC: {r.rfc}
          </li>
        ))}
      </ul>
    </ListaContainer>
  );
};

export default ListaComidas;
