import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:michael_app/controller/galericontroller.dart';

part 'galeri_state.dart';
part 'galeri_event.dart';

class GaleriBloc extends Bloc<GaleriEvent, GaleriState> {
  GaleriBloc() : super(GaleriState());

  List url = [];

  @override
  Stream<GaleriState> mapEventToState(GaleriEvent event) async* {
    if (event is UpdateGaleriEvent) {
      final resp = await galeriController.getDataPhoto();

      url.clear();

      print(resp!.msj);

      if (resp.resp == true) {
        resp.information.forEach((element) {
          url.add("https://projectkitaid.com/gambar/$element");
        });
      } else {
        url = url;
      }

      yield state.copyWiht(galeri: url, status: resp.msj);
    }
  }
}
