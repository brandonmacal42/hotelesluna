export interface Empleado {
  idempleado: number;
  idhotel: number;
  nombre: string;
  apellidop: string;
  apellidom: string;
  calle: string;
  numerointerior: number;
  numeroexterior: number;
  colonia: string;
  estado: string;
  horario: string; // formato 'HH:MM:SS'
  fechanacimiento: string; // formato 'YYYY-MM-DD'
  fechacontratacion: string; // formato 'YYYY-MM-DD'
  genero: string;
  rfc: string;
}