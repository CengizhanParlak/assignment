// import 'package:mobx/mobx.dart';

// class DestinationsStore = DestinationsStoreBase with _$DestinationsStore;

// abstract class DestinationsStoreBase with Store {
//   static const List<Destination> destinations = Destination.values;

//   @observable
//   int selectedDestinationIndex = destinations.indexOf(Destination.Home);

//   @computed
//   Destination get selectedDestination => destinations[selectedDestinationIndex];

//   @action
//   void selectDestination(int index) {
//     selectedDestinationIndex = index;
//   }
// }