class Catalogo{
  final int id;
  final String nombre;
  final String precio;
  final String imagen;
  final String tiempo;
  const Catalogo(this.id, this.nombre, this.precio, this.imagen, this.tiempo);
}

final catalogo = <Catalogo>[
  new Catalogo(1, "Corte de pelo Hombre", "90", 'assets/CortePeloHombre.jpg',"30 min"),
  new Catalogo(2, "Corte de pelo Mujer", "100", 'assets/CortePeloMujer.jpg',"30 min"),
  new Catalogo(3, "Manicure y pedicure", "450", 'assets/ManiPedi.jpg',"60 min"),
  new Catalogo(4, "Peinado y maquillaje Gala", "450", 'assets/PeloGala.jpg',"120 min"),
  new Catalogo(5, "Peinado y maquillaje casual", "250", 'assets/PeloCasual.jpg',"120 min"),
  new Catalogo(6, "Colorimetría con base", "800 - 1500", 'assets/ColorimetríaBase.jpg',"120 min"),
  new Catalogo(7, "Colorimetría sin base", "600 - 1300", 'assets/ColorimetríaNatural.jpg',"120 min"),
  new Catalogo(8, " Rizado de pestañas \n     permanentes", "150", 'assets/RizadoPestañas.jpg',"30 min"),
  new Catalogo(9, "Planchado de cejas", "100", 'assets/PlanchadoCejas.jpg',"30 min"),
  new Catalogo(10, "Alaciado permanente", "400 - 900", 'assets/AlaciadoPerma.jpg',"30 min"),
  new Catalogo(11, "Trenzas con extensión", "300 - 700", 'assets/TrenzasExten.jpg',"60 min"),
];
