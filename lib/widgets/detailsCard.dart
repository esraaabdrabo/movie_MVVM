import 'package:flutter/material.dart';
import 'package:mov/Model/response.dart';
import 'package:mov/assets/functions.dart';
import 'package:mov/myThemeData.dart';
import 'package:mov/view_model/watchList.dart';
import 'package:mov/views/movie_details.dart';
import 'package:mov/widgets/cached_img.dart';
import 'package:provider/provider.dart';

class MovieDetailsCard extends StatefulWidget {
  final Movie movie;
  final bool showDetails;
  const MovieDetailsCard(this.movie, {super.key, this.showDetails = true});
  @override
  _MovieDetailsCardState createState() => _MovieDetailsCardState();
}

class _MovieDetailsCardState extends State<MovieDetailsCard> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final WatchListVM watchListProvider = Provider.of(context);

    return Container(
      margin: EdgeInsets.only(
        right: screenWidth * .05,
        left: screenWidth * .05,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: MyThemeData.accent,
      ),
      width: screenWidth * .5,
      child: Column(
        children: [
          if (widget.showDetails)
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    goto(context: context, screen: MoreLikeThis(widget.movie));
                  },
                  child: Padding(
                    padding:
                        !widget.showDetails
                            ? EdgeInsets.only(
                              right: screenWidth * .05,
                              left: screenWidth * .05,
                              bottom: screenWidth * .1,
                            )
                            : EdgeInsets.zero,
                    child: Stack(
                      children: [
                        Container(
                          height:
                              !widget.showDetails
                                  ? //details card
                                  screenHeight * .3
                                  : screenHeight * .25,
                          width: screenWidth * .5,
                          decoration: BoxDecoration(
                            borderRadius:
                                (widget.showDetails
                                    ? BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    )
                                    : BorderRadius.circular(5)),
                          ),
                          child: CachedImg(
                            path:
                                // TODO: HANDLE IN PARSIING
                                'https://image.tmdb.org/t/p/w185/${widget.movie.posterPath}',
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                watchListProvider.isInWatchList(widget.movie.id)
                                    ? MyThemeData.golden
                                    : MyThemeData.mediumGray,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                            ),
                          ),
                          padding: EdgeInsets.all(3),
                          //add//
                          child: IconButton(
                            icon: Icon(
                              watchListProvider.isInWatchList(widget.movie.id)
                                  ? Icons.check
                                  : Icons.add,
                              size: screenWidth * .08,
                              color: MyThemeData.white60,
                            ),
                            onPressed: () {
                              watchListProvider.addToWatchList(widget.movie);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //rating//
                Row(
                  children: [
                    Icon(Icons.star, color: MyThemeData.golden, size: 15),
                    Padding(padding: EdgeInsets.only(left: 3.0)),
                    Text(
                      widget.movie.voteAverage.ceilToDouble().toString(),
                      style: TextStyle(
                        color: MyThemeData.white60,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(5)),

                //moviename//
                Text(
                  widget.movie.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: MyThemeData.mediumGray,
                    letterSpacing: 2,
                    fontSize: 10,
                  ),
                ),
                Padding(padding: EdgeInsets.all(5)),

                //year//
                Text(
                  widget.movie.releaseDate,
                  style: TextStyle(
                    color: MyThemeData.mediumGray,
                    letterSpacing: 2,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * Converting an unnecessary `StatefulWidget` to a `StatelessWidget` aligns with several software design principles, particularly:  

---

### **1️⃣ Single Responsibility Principle (SRP) – (SOLID Principle)**  
- A **StatelessWidget** has a single responsibility: to display UI based on input data.  
- A **StatefulWidget**, however, manages both UI **and** state, which adds extra responsibility.  
- If a widget **does not need to manage state**, keeping it `Stateful` violates SRP.  
✅ **Refactoring it to `StatelessWidget` enforces SRP** by making it responsible only for rendering UI.  

---

### **2️⃣ Open/Closed Principle (OCP) – (SOLID Principle)**  
- The **Open/Closed Principle** states that a class should be **open for extension but closed for modification**.  
- A `StatelessWidget` is **more reusable** and **less prone to modification** compared to a `StatefulWidget`.  
- If you need additional behavior, you can **wrap it with another widget** rather than modifying it.  

---

### **3️⃣ Avoiding Unnecessary Complexity (YAGNI & KISS Principles)**  
- **YAGNI (You Ain’t Gonna Need It)** → If a widget doesn’t need state, don’t add it.  
- **KISS (Keep It Simple, Stupid)** → A `StatelessWidget` is simpler and easier to maintain than a `StatefulWidget`.  

---

### **4️⃣ Performance Optimization (DRY & Efficiency)**  
- **A `StatelessWidget` is more efficient** because Flutter can **rebuild it more optimally** compared to `StatefulWidget`.  
- This reduces unnecessary computations and makes your UI **more responsive**.  

---

### 🔹 **Example Refactoring**  

❌ **Before: Unnecessary `StatefulWidget` (Bad Practice)**  
```dart
class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Text("Hello, Flutter!");
  }
}
```
⚠ **This widget does not change** → `StatefulWidget` is unnecessary!  

✅ **After: Using `StatelessWidget` (Best Practice)**  
```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Hello, Flutter!");
  }
}
```
✔ **Simpler**  
✔ **More efficient**  
✔ **Easier to maintain**  

---

### **Final Thought**  
✅ Converting `StatefulWidget` to `StatelessWidget` aligns with **SRP, OCP, KISS, and YAGNI principles**.  
✅ Always **start with `StatelessWidget` first** and **only use `StatefulWidget` when necessary** to **improve performance and maintainability**.  

Would you like help refactoring any specific widget in your project? 🚀
 */
