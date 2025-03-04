
abstract class NewsState{}

class NewsInitialState extends NewsState{}
class NewsBottomNavState extends NewsState{}

class BusinessLoadingState extends NewsState{}
class BusinessSuccessState extends NewsState{}
class BusinessErrorState extends NewsState{
  BusinessErrorState(String error);
}

class SportsLoadingState extends NewsState{}
class SportsSuccessState extends NewsState{}
class SportsErrorState extends NewsState{
  SportsErrorState(String error);
}

class ScienceLoadingState extends NewsState{}
class ScienceSuccessState extends NewsState{}
class ScienceErrorState extends NewsState{
  ScienceErrorState(String error);
}

class ThemeModeState extends NewsState{}

class SearchLoadingState extends NewsState{}
class SearchSuccessState extends NewsState{}
class SearchErrorState extends NewsState{
  SearchErrorState(String error);
}