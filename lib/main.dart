import 'package:flutter/material.dart';

void main() {
  runApp(const LaRomaApp());
}

class LaRomaApp extends StatelessWidget {
  const LaRomaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurante La ROMA',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const MenuScreen(),
    );
  }
}

// Modelo de datos para nuestros platillos
class Platillo {
  final String imageUrl;
  final String titulo;
  final String subtitulo;
  final int estrellas;

  Platillo({
    required this.imageUrl,
    required this.titulo,
    required this.subtitulo,
    required this.estrellas,
  });
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Lista de 14 platillos consumiendo imágenes desde GitHub
  // NOTA: Reemplaza las URLs con los enlaces "Raw" de tus imágenes en GitHub
  final String githubBaseUrl = "https://github.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/tree/main";

  late List<Platillo> menuLaRoma;

  @override
  void initState() {
    super.initState();
    // Generamos los 14 platillos para tu negocio
    menuLaRoma = [
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/pizza.png', titulo: 'Pizza Margarita', subtitulo: 'Tomate, mozzarella y albahaca', estrellas: 5),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/pizza1.png', titulo: 'Pasta Carbonara', subtitulo: 'Receta tradicional romana', estrellas: 5),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/lasagna.png', titulo: 'Lasaña de Carne', subtitulo: 'Al horno de leña', estrellas: 4),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/pastel.png', titulo: 'Pastel', subtitulo: 'Postre clásico de café', estrellas: 5),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/ens.png', titulo: 'Ensalada César', subtitulo: 'Aderezo de la casa', estrellas: 4),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/br.png', titulo: 'Bruschetta', subtitulo: 'Pan tostado con tomate', estrellas: 3),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/pasta.png', titulo: 'Risotto', subtitulo: 'Con champiñones frescos', estrellas: 4),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/rev.png', titulo: 'Raviolis', subtitulo: 'Rellenos de queso ricotta', estrellas: 5),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/panna.png', titulo: 'Panna Cotta', subtitulo: 'Con frutos rojos', estrellas: 4),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/calzone.png', titulo: 'Calzone', subtitulo: 'Relleno de carnes frías', estrellas: 4),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/pasta.png', titulo: 'Minestrone', subtitulo: 'Sopa de vegetales', estrellas: 3),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/gelato.png', titulo: 'Gelato Italiano', subtitulo: 'Pistacho y vainilla', estrellas: 5),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/focc.png', titulo: 'Focaccia', subtitulo: 'Pan con romero y oliva', estrellas: 4),
      Platillo(imageUrl: 'https://raw.githubusercontent.com/sanchez-herlinda/Imagenes_para_Flutter_6J-11-Feb-2026/refs/heads/main/pollo.png', titulo: 'Pollo Parmigiana', subtitulo: 'Empanizado con queso', estrellas: 5),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurante La ROMA'),
        backgroundColor: Colors.redAccent,
      ),
      // GridView.builder es ideal para crear cuadrículas eficientes
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: menuLaRoma.length, // Serán 14 elementos
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 Columnas
            childAspectRatio: 0.7, // Ajusta este valor si tu tarjeta se ve muy estirada o aplastada
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final platillo = menuLaRoma[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Imagen en la parte superior (toma el espacio restante)
                  Expanded(
                    child: Image.network(
                      platillo.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      // Placeholder por si la imagen de GitHub falla o carga lento
                      errorBuilder: (context, error, stackTrace) => 
                          const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey)),
                    ),
                  ),
                  // Parte inferior con las 3 filas requeridas
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Fila 1: Título
                        Text(
                          platillo.titulo,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Fila 2: Subtítulo
                        Text(
                          platillo.subtitulo,
                          style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        // Fila 3: Estrellitas
                        Row(
                          children: List.generate(5, (starIndex) {
                            return Icon(
                              starIndex < platillo.estrellas ? Icons.star : Icons.star_border,
                              color: Colors.amber,
                              size: 16,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}