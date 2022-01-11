import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Obtenemos el tamaño de la pantalla del dispositivo
    final size = MediaQuery.of(context).size;
    return Container(
      //Ancho se estira toda la pantalla
      //width: size.width,
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        //Número de tarjetas a mostrar
        itemCount: 10,
        //Forma que tomaran las cartas
        layout: SwiperLayout.STACK,
        //Ancho de la tarjeta
        itemWidth: size.width * 0.6,
        //Alto de la tarjeta
        itemHeight: size.height * 0.4,
        //Lo que vamos a construir
        itemBuilder: (context, index) {
          return GestureDetector(
            //Navigator es para ir a otra ventana con argumentos
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: 'movie'),
            child: ClipRRect(
              //Darle un borde redondeado
              borderRadius: BorderRadius.circular(20),
              //FadeInImage es un widget para usar imagenes en la app
              child: FadeInImage(
                placeholder:
                    NetworkImage('https://via.placeholder.com/300x400'),
                image: NetworkImage('https://via.placeholder.com/400x500'),
              ),
            ),
          );
        },
      ),
    );
  }
}
