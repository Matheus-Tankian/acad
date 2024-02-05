import 'package:sipaealuno/src/models/horario/horario_model.dart';

final List<DiaModel> diasMock = [
  DiaModel(
    dia: 'Domingo',
    horarios: [],
  ),
  DiaModel(
    dia: 'Segunda',
    horarios: horarios1Mock,
  ),
  DiaModel(
    dia: 'Terça',
    horarios: horarios2Mock,
  ),
  DiaModel(
    dia: 'Quarta',
    horarios: horarios1Mock,
  ),
  DiaModel(
    dia: 'Quinta',
    horarios: horarios2Mock,
  ),
  DiaModel(
    dia: 'Sexta',
    horarios: horarios1Mock,
  ),
  DiaModel(
    dia: 'Sábado',
    horarios: [],
  ),
];

final List<HorarioModel> horarios1Mock = [
  HorarioModel(
    horaInicial: '07:00',
    horaFinal: '09:00',
    materia: 'Artes',
    nomeProfessor: 'Raimundo Nonanto nonato nonato ',
  ),
  HorarioModel(
    horaInicial: '09:00',
    horaFinal: '11:00',
    materia: 'Protugues',
    nomeProfessor: 'Nonanto Silva',
  ),
  HorarioModel(
    horaInicial: '11:00',
    horaFinal: '12:00',
    materia: 'Artes',
    nomeProfessor: 'Raimundo Oliveira',
  ),
];

final List<HorarioModel> horarios2Mock = [
  HorarioModel(
    horaInicial: '07:00',
    horaFinal: '08:00',
    materia: 'Artes',
    nomeProfessor: 'Alice Alves',
  ),
  HorarioModel(
    horaInicial: '08:00',
    horaFinal: '09:00',
    materia: 'Protugues',
    nomeProfessor: 'Angela Alves',
  ),
  HorarioModel(
    horaInicial: '09:00',
    horaFinal: '10:00',
    materia: 'Artes',
    nomeProfessor: 'Domingos Dias',
  ),
  HorarioModel(
    horaInicial: '10:00',
    horaFinal: '11:00',
    materia: 'Artes',
    nomeProfessor: 'José Alberto',
  ),
  HorarioModel(
    horaInicial: '11:00',
    horaFinal: '12:00',
    materia: 'Protugues',
    nomeProfessor: 'Antonio Davi',
  ),
];
