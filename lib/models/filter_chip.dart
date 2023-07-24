class FilterChipData {
  String label;
  bool isSelected;

  FilterChipData(this.label, this.isSelected);
}

List<FilterChipData> categories = [
  FilterChipData("Raza", false),
  FilterChipData("Tamaño de Bolsa", false),
  FilterChipData("Marcas", false),
  FilterChipData("Edad", false)
];