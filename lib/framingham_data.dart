import 'package:flutter/material.dart';

class MaleData {
  static const List<List<String>> agePointsTable = [
    ["Idade", "Pontos"],
    ["30-34", "-1"],
    ["35-39", "0"],
    ["40-44", "1"],
    ["45-49", "2"],
    ["50-54", "3"],
    ["55-59", "4"],
    ["60-64", "5"],
    ["65-69", "6"],
    ["70-74", "7"],
  ];

  static const List<List<String>> ldlCholesterolTable = [
    ["mg/dL", "Pontos"],
    ["<100", "-3"],
    ["100-129", "0"],
    ["130-159", "0"],
    ["160-169", "1"],
    [">=190", "2"],
  ];

  static const List<List<String>> hdlCholesterolTable = [
    ["mg/dL", "Pontos"],
    ["<35", "2"],
    ["35-44", "1"],
    ["45-49", "0"],
    ["50-59", "0"],
    [">=60", "-1"],
  ];

  static const List<List<String>> diabetesTable = [
    ["Diabetes", "Pontos"],
    ["Não", "0"],
    ["Sim", "2"]
  ];

  static const List<List<String>> smokingTable = [
    ["Tabagismo", "Pontos"],
    ["Não", "0"],
    ["Sim", "2"]
  ];

  static const List<List<String>> bloodPressureTable = [
    ["sistólica", "<80", "80-84", "85-89", "90-99", ">=100"],
    ["<120", "0", "0", "1", "2", "3"],
    ["120-129", "0", "0", "1", "2", "3"],
    ["130-139", "1", "1", "1", "2", "3"],
    ["140-159", "2", "2", "2", "2", "3"],
    [">=160", "3", "3", "3", "3", "3"],
  ];

  static const List<List<String>> sumPointsTable = [
    ["Total pontos", "risco DAC 10 anos"],
    ["<= -3", "1%"],
    ["-2", "2%"],
    ["-1", "2%"],
    ["0", "3%"],
    ["1", "4%"],
    ["2", "4%"],
    ["3", "6%"],
    ["4", "7%"],
    ["5", "9%"],
    ["6", "11%"],
    ["7", "14%"],
    ["8", "18%"],
    ["9", "22%"],
    ["10", "27%"],
    ["11", "33%"],
    ["12", "40%"],
    ["13", "47%"],
    [">=14", ">=56%"]
  ];
}

class FemaleData {
  static const List<List<String>> agePointsTable = [
    ["Idade", "Pontos"],
    ["30-34", "-9"],
    ["35-39", "-4"],
    ["40-44", "0"],
    ["45-49", "3"],
    ["50-54", "6"],
    ["55-59", "7"],
    ["60-64", "8"],
    ["65-69", "8"],
    ["70-74", "8"],
  ];

  static const List<List<String>> ldlCholesterolTable = [
    ["mg/dL", "Pontos"],
    ["<100", "-2"],
    ["100-129", "0"],
    ["130-159", "0"],
    ["160-169", "2"],
    [">=190", "2"],
  ];

  static const List<List<String>> hdlCholesterolTable = [
    ["mg/dL", "Pontos"],
    ["<35", "5"],
    ["35-44", "2"],
    ["45-49", "1"],
    ["50-59", "0"],
    [">=60", "-2"],
  ];

  static const List<List<String>> diabetesTable = [
    ["Diabetes", "Pontos"],
    ["Não", "0"],
    ["Sim", "4"]
  ];

  static const List<List<String>> smokingTable = [
    ["Tabagismo", "Pontos"],
    ["Não", "0"],
    ["Sim", "2"]
  ];

  static const List<List<String>> bloodPressureTable = [
    ["sistólica", "<80", "80-84", "85-89", "90-99", ">=100"],
    ["<120", "-3", "0", "0", "2", "3"],
    ["120-129", "0", "0", "0", "2", "3"],
    ["130-139", "0", "0", "0", "2", "3"],
    ["140-159", "2", "2", "2", "2", "3"],
    [">=160", "3", "3", "3", "3", "3"],
  ];

  static const List<List<String>> sumPointsTable = [
    ["Total pontos", "risco DAC 10 anos"],
    ["<= -2", "1%"],
    ["-1", "2%"],
    ["0", "2%"],
    ["1", "2%"],
    ["2", "3%"],
    ["3", "3%"],
    ["4", "4%"],
    ["5", "5%"],
    ["6", "6%"],
    ["7", "7%"],
    ["8", "8%"],
    ["9", "9%"],
    ["10", "11%"],
    ["11", "13%"],
    ["12", "15%"],
    ["13", "17%"],
    ["14", "20%"],
    ["15", "24%"],
    ["16", "27%"],
    [">=17", ">=32%"]
  ];
}