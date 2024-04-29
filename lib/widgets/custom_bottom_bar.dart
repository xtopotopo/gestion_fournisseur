import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomBar extends GetView {
  const CustomBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     
     height: 60,
     width: double.maxFinite,
     decoration: BoxDecoration(
       color: Theme.of(context).colorScheme.background,
       boxShadow: [
         BoxShadow(
           color: Colors.grey.withOpacity(0.3),
           spreadRadius: 1,
           blurRadius: 5,
           offset: const Offset(0, 3),
         ),
       ],
     ),
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Expanded(
           child: Padding(
             padding: const EdgeInsets.only(right: 10.0),
             child: Material(
               color: Colors.transparent,
               child: InkWell(
                  borderRadius:const BorderRadius.all(Radius.elliptical(15, 50)),
                  splashFactory: InkRipple.splashFactory,
                  onTap: () {},

                  highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home_filled,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
           )  ,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:8.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:const BorderRadius.all(Radius.elliptical(15, 50)),
                  splashFactory: InkRipple.splashFactory,
                  onTap: () {},
                  highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
                  splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business_rounded,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(height: 3),
                      Text(
                        "Suppliers",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

