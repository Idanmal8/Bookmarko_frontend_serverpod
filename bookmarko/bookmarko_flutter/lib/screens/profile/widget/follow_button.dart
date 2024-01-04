import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const FollowButtonInteractive();
  }
}

class FollowButtonInteractive extends StatefulWidget {
  const FollowButtonInteractive({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButtonInteractive> {
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFollowed = !isFollowed;
        });
        // print('Follow button pressed ' + isFollowed.toString() );
      },
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 200),
        firstChild: buildButton(Colors.white),
        secondChild: buildButton(const Color.fromARGB(255, 181, 160, 217)), 
        crossFadeState: isFollowed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      ),
    );
  }

  Widget buildButton(Color backgroundColor) {
    return SizedBox(
      width: 100,
      child: OutlinedButton(
        onPressed:
            null, // null makes it non-clickable since we are handling the click via GestureDetector
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: backgroundColor,
          side: const BorderSide(
              color: Color.fromARGB(144, 0, 0, 0), width: 1.0), // Black border
        ),
        child: Text(
          isFollowed ? 'Following' : 'Follow',
          style: TextStyle(
              color: isFollowed ? Colors.white : Colors.black , fontSize: 12,
              fontWeight: isFollowed ? FontWeight.bold : FontWeight.bold),
        ),
      ),
    );
  }
}
