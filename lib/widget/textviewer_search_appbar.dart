import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? leading;
  final bool showBackButton;
  final Function(String value) searchCallBack;
  final Color? searchHintColor;
  final Color? searchTextColor;
  const SearchAppBar(
      {Key? key,
      this.leading,
      required this.showBackButton,
      required this.searchCallBack,
      this.searchHintColor,
      this.searchTextColor})
      : super(key: key);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchAppBarState extends State<SearchAppBar> {
  late final TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        leading: widget.leading,
        automaticallyImplyLeading: widget.showBackButton,
        title: TextField(
          controller: searchController,
          style: TextStyle(
            color: widget.searchTextColor ?? Colors.white,
          ),
          decoration: InputDecoration(
              //prefixIcon: Icon(Icons.search, color: Colors.white),
              hintText: "Search...",
              hintStyle:
                  TextStyle(color: widget.searchHintColor ?? Colors.white)),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => widget.searchCallBack(searchController.text),
          ),
        ]);
  }
}
