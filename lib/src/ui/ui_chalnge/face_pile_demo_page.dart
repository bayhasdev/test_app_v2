import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_app_v2/src/utilities/constants.dart';
import 'package:test_app_v2/src/utilities/models/user_model.dart';
import 'package:test_app_v2/src/utilities/users_constatns.dart';

class FacePileDemoScreen extends StatefulWidget {
  const FacePileDemoScreen({Key? key}) : super(key: key);

  @override
  State<FacePileDemoScreen> createState() => _FacePileDemoScreenState();
}

class _FacePileDemoScreenState extends State<FacePileDemoScreen> {
  late List<UserModle> _availableUsers;
  final List<UserModle> _facePileUsers = [];

  @override
  void initState() {
    super.initState();

    _populateFakeUsers();
  }

  Future<void> _populateFakeUsers() async {
    _availableUsers = generateUsers(count: 25);
  }

  void _addUserToPile() {
    if (_availableUsers.isNotEmpty) {
      final user = _availableUsers.removeLast();
      setState(() {
        _facePileUsers.add(user);
      });
    }
  }

  void _removeUserFromPile() {
    if (_facePileUsers.isNotEmpty) {
      final randomIndex = Random().nextInt(_facePileUsers.length);
      setState(() {
        final user = _facePileUsers.removeAt(randomIndex);
        _availableUsers.insert(0, user);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FacePileDemoScreen')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 200),
          child: FacePile(
            users: _facePileUsers,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: '_removeUserFromPile',
            onPressed: _removeUserFromPile,
            mini: true,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 24),
          FloatingActionButton(
            heroTag: '_addUserToPile',
            onPressed: _addUserToPile,
            mini: true,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class FacePile extends StatefulWidget {
  const FacePile({
    Key? key,
    required this.users,
    this.faceSize = 48,
    this.facePercentOverlap = 0.1,
  }) : super(key: key);

  final List<UserModle> users;
  final double faceSize;
  final double facePercentOverlap;

  @override
  _FacePileState createState() => _FacePileState();
}

class _FacePileState extends State<FacePile> with SingleTickerProviderStateMixin {
  final _visibleUsers = <UserModle>[];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _syncUsersWithPile();
    });
  }

  @override
  void didUpdateWidget(FacePile oldWidget) {
    super.didUpdateWidget(oldWidget);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      _syncUsersWithPile();
    });
  }

  void _syncUsersWithPile() {
    setState(() {
      final newUsers = widget.users.where(
        (user) => _visibleUsers.where((visibleUser) => visibleUser == user).isEmpty,
      );

      for (final newUser in newUsers) {
        _visibleUsers.add(newUser);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final facesCount = _visibleUsers.length;

        double facePercentVisible = 1.0 - widget.facePercentOverlap;

        final maxIntrinsicWidth = facesCount > 1 ? (1 + (facePercentVisible * (facesCount - 1))) * widget.faceSize : widget.faceSize;

        late double leftOffset;
        if (maxIntrinsicWidth > constraints.maxWidth) {
          leftOffset = 0;
          facePercentVisible = ((constraints.maxWidth / widget.faceSize) - 1) / (facesCount - 1);
        } else {
          leftOffset = (constraints.maxWidth - maxIntrinsicWidth) / 2;
        }

        if (constraints.maxWidth < widget.faceSize) {
          // There isn't room for a single face. Show nothing.
          return const SizedBox();
        }

        return SizedBox(
          height: widget.faceSize,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              for (var i = 0; i < facesCount; i += 1)
                AnimatedPositioned(
                  key: ValueKey(_visibleUsers[i].id),
                  top: 0,
                  height: widget.faceSize,
                  left: leftOffset + (i * facePercentVisible * widget.faceSize),
                  width: widget.faceSize,
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  child: AppearingAndDisappearingFace(
                    user: _visibleUsers[i],
                    showFace: widget.users.contains(_visibleUsers[i]),
                    faceSize: widget.faceSize,
                    onDisappear: () {
                      setState(() {
                        _visibleUsers.removeAt(i);
                      });
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}

class AppearingAndDisappearingFace extends StatefulWidget {
  const AppearingAndDisappearingFace({
    Key? key,
    required this.user,
    required this.faceSize,
    required this.showFace,
    required this.onDisappear,
  }) : super(key: key);

  final UserModle user;
  final double faceSize;
  final bool showFace;
  final VoidCallback onDisappear;

  @override
  _AppearingAndDisappearingFaceState createState() => _AppearingAndDisappearingFaceState();
}

class _AppearingAndDisappearingFaceState extends State<AppearingAndDisappearingFace> with SingleTickerProviderStateMixin {
  late AnimationController _scaleController;
  late Animation _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          widget.onDisappear();
        }
      });
    _scaleAnimation = CurvedAnimation(
      parent: _scaleController,
      curve: Curves.elasticOut,
    );

    _syncScaleAnimationWithWidget();
  }

  @override
  void didUpdateWidget(AppearingAndDisappearingFace oldWidget) {
    super.didUpdateWidget(oldWidget);

    _syncScaleAnimationWithWidget();
  }

  void _syncScaleAnimationWithWidget() {
    if (widget.showFace && !_scaleController.isCompleted && _scaleController.status != AnimationStatus.forward) {
      _scaleController.forward();
    } else if (!widget.showFace && !_scaleController.isDismissed && _scaleController.status != AnimationStatus.reverse) {
      _scaleController.reverse();
    }
  }

  @override
  void dispose() {
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.faceSize,
      height: widget.faceSize,
      child: Center(
        child: AnimatedBuilder(
          animation: _scaleAnimation,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: AvatarCircle(
                user: widget.user,
                size: widget.faceSize,
                nameLabelColor: const Color(0xFF222222),
                backgroundColor: const Color(0xFF888888),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AvatarCircle extends StatefulWidget {
  const AvatarCircle({
    Key? key,
    required this.user,
    this.size = 48,
    required this.nameLabelColor,
    required this.backgroundColor,
  }) : super(key: key);

  final UserModle user;
  final double size;
  final Color nameLabelColor;
  final Color backgroundColor;

  @override
  _AvatarCircleState createState() => _AvatarCircleState();
}

class _AvatarCircleState extends State<AvatarCircle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 3),
          )
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.user.name ?? 'userName',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: widget.nameLabelColor,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: widget.user.photo ?? '',
            fadeInDuration: const Duration(milliseconds: 250),
          ),
        ],
      ),
    );
  }
}
