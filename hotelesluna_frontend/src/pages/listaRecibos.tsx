import { useReciboContext } from "../context/ReciboContext";
import ListaContainer from "../components/layout/ListaContainer";

const ListaRecibos = () => {
  const { Recibos } = useReciboContext();
  return (
    <ListaContainer title="Lista de Recibos">
      <ul>
        {Recibos.map((recibo, idx) => (
          <li
            key={recibo.idrecibo ?? idx}
            className="border-b last:border-none py-2"
          >
            <strong>Recibo #{recibo.idrecibo}</strong> - Huésped:{" "}
            {recibo.idhuesped} - Hotel: {recibo.idhotel} - Habitación:{" "}
            {recibo.nohabitacion} <br />
            CheckIn: {recibo.checkin} - Checkout: {recibo.checkout} <br />
            Membresía: {recibo.nomembresia ?? "N/A"} - Miembro:{" "}
            {recibo.esmiembro ? "Sí" : "No"} - Mascota:{" "}
            {recibo.mascota ? "Sí" : "No"} <br />
            Tipo de Habitación: {recibo.tipohabitacion} - Tipo de Pago:{" "}
            {recibo.tipopago}
          </li>
        ))}
      </ul>
    </ListaContainer>
  );
};

export default ListaRecibos;
