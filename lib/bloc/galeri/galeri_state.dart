part of 'galeri_bloc.dart';

class GaleriState {
  List galeri;
  String status;

  GaleriState({this.galeri = const [], this.status = ''});

  GaleriState copyWiht({required List galeri, required String status}) =>
      GaleriState(galeri: galeri, status: status);
}
