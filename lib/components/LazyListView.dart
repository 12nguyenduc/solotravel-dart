import 'package:flutter/material.dart';
import 'package:quiver/cache.dart';
import 'package:quiver/collection.dart';

typedef Future<List<T>> PageFuture<T>(int pageIndex);

typedef Widget ItemBuilder<T>(BuildContext context, int index, T entry);
typedef Widget WaitBuilder(BuildContext context);
typedef Widget PlaceholderBuilder(BuildContext context);
typedef Widget EmptyResultBuilder(BuildContext context);
typedef Widget ErrorBuilder(BuildContext context);

class LazyListView<T> extends StatefulWidget {
  final int pageSize;
  final PageFuture<T> pageFuture;
  final Stream<int> countStream;

  final ItemBuilder<T> itemBuilder;
  final WaitBuilder waitBuilder;
  final PlaceholderBuilder placeholderBuilder;
  final EmptyResultBuilder emptyResultBuilder;
  final ErrorBuilder errorBuilder;

  LazyListView(
      {@required this.pageSize,
        @required this.pageFuture,
        @required this.countStream,
        @required this.itemBuilder,
        @required this.waitBuilder,
        @required this.placeholderBuilder,
        @required this.emptyResultBuilder,
        @required this.errorBuilder});

  @override
  _LazyListView<T> createState() => _LazyListView<T>();
}

class _LazyListView<T> extends State<LazyListView<T>> {
  Map<int, PageResult<T>> map;
  MapCache<int, PageResult<T>> cache;

  Object error;

  int totalCount = -1;

  @override
  void initState() {
    super.initState();
    map = LruMap<int, PageResult<T>>(maximumSize: 50 ~/ widget.pageSize);
    cache = MapCache<int, PageResult<T>>(map: map);

    widget.countStream.listen((int count) {
      print("Total count changed: $count");
      totalCount = count;

      map.clear();

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return widget.errorBuilder(context);
    }
    if (totalCount == -1) {
      return widget.waitBuilder(context);
    }
    if (totalCount == 0) {
      return widget.emptyResultBuilder(context);
    }
    return ListView.builder(
      key: Key("listView"),
      itemCount: totalCount,
      itemBuilder: (context, index) {
        int currentPage = index ~/ widget.pageSize;
        final pageResult = map[currentPage];
        final value = pageResult == null ? null : pageResult.items[index % widget.pageSize];
        final loading = (value == null);
        if (loading) {
          cache.get(currentPage, ifAbsent: _loadPage).then(_reload);
          return widget.placeholderBuilder(context);
        }
        return widget.itemBuilder(context, index, value);
      },
    );
  }

  Future<PageResult<T>> _loadPage(int index) {
    print("Start fetch page $index");
    return widget.pageFuture(index).then((list) => PageResult(index, list));
  }

  _reload(PageResult<T> value) {
    if (value.refreshed) {
      // Avoid calling setState if already called.
      print("Skipping refreshing for result of page ${value.index}");
      return;
    }
    setState(() {
      value.refreshed = true;
    });
  }
}

class PageResult<T> {
  /// Page index of this data.
  final int index;

  final List<T> items;
  bool refreshed = false;

  PageResult(this.index, this.items);
}
