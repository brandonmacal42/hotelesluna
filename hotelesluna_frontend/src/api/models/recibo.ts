export interface Recibo {
  idrecibo: number;
  idhuesped: number;
  idhotel: number;
  nohabitacion: number;
  checkin: string;         // formato 'YYYY-MM-DD'
  checkout: string;        // formato 'YYYY-MM-DD'
  nomembresia: number;
  esmiembro: boolean;
  mascota: boolean;
  tipohabitacion: string;
  tipopago: string;
}