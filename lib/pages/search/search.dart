import 'package:mymusic/pages/screens.dart';
import 'package:mymusic/widget/column_builder.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool clear = false;
  final searchHistoryList = [
    {
      'searchText': 'Leave Me Lonely',
      'searchType': 'Song',
    },
    {
      'searchText': 'Party Rock Anthem',
      'searchType': 'Song',
    },
    {
      'searchText': 'Rim Jhim Gire Sawan',
      'searchType': 'Song',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          searchBar(context),
          title(),
          heightSpace,
          heightSpace,
          heightSpace,
          clear || searchHistoryList.length == 0
              ? Text(
                  'History is Clear',
                  textAlign: TextAlign.center,
                  style: greyColor12MediumTextStyle,
                )
              : searchHistory(),
          divider(),
          InkWell(
            onTap: () {
              setState(() {
                clear = true;
              });
            },
            child: Text(
              'Clear history',
              textAlign: TextAlign.center,
              style: blackColor15SemiBoldTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  searchBar(context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.24,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/corner-design.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20.0,
          right: 20.0,
          top: 145.0,
          child: Container(
            padding: EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: TextField(
              cursorColor: greyColor,
              style: greyColor16RegularTextStyle,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: 'Search for artist,song or lyrics...',
                hintStyle: greyColor16RegularTextStyle,
                suffixIcon: Icon(
                  Icons.search,
                  color: greyColor,
                ),
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
      ],
    );
  }

  title() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding,
      ),
      child: Text(
        'Search history',
        style: blackColor15SemiBoldTextStyle,
      ),
    );
  }

  searchHistory() {
    return ColumnBuilder(
      itemCount: searchHistoryList.length,
      itemBuilder: (context, index) {
        final item = searchHistoryList[index];
        return Padding(
          padding: EdgeInsets.fromLTRB(
              fixPadding * 2.0, 0.0, fixPadding * 2.0, fixPadding * 1.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['searchText'],
                    style: blackColor13MediumTextStyle,
                  ),
                  Text(
                    item['searchType'],
                    style: greyColor10MediumTextStyle,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    searchHistoryList.remove(searchHistoryList[index]);
                  });
                },
                child: Icon(
                  Icons.close,
                  color: blackColor.withOpacity(0.6),
                  size: 18,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  divider() {
    return Container(
      margin: EdgeInsets.all(fixPadding * 2.0),
      color: greyColor.withOpacity(0.2),
      height: 1.0,
      width: double.infinity,
    );
  }
}
