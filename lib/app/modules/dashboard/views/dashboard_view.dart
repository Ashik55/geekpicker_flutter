import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geekpicker_flutter/app/data/remote/dashboard_response.dart';
import 'package:geekpicker_flutter/app/modules/componenets/CenterCircularProgressBar.dart';
import 'package:geekpicker_flutter/app/modules/componenets/custom_textwidget.dart';
import 'package:geekpicker_flutter/app/modules/componenets/network_image_component.dart';
import 'package:geekpicker_flutter/app/utils/colors.dart';
import 'package:geekpicker_flutter/app/utils/constants.dart';
import 'package:geekpicker_flutter/app/utils/dimens.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (controller) => Scaffold(
                body: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.all(Dimens.basePaddingLarge),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ic_logo.svg',
                        fit: BoxFit.cover,
                        width: 35,
                        height: 25,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Badge(
                          position: BadgePosition.topEnd(),
                          badgeContent: CText(
                            text: "4",
                            textColor: Colors.white,
                          ),
                          badgeColor: Colors.red,
                          child: SvgPicture.asset(
                            'assets/icons/ic_bell.svg',
                            height: 22,
                            width: 22,
                          ),
                        ),
                      ),
                      Image.asset("assets/images/profile.png"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: Dimens.basePadding, bottom: Dimens.basePadding),
                  child: Row(
                    children: [
                      Expanded(
                        child: Card(
                          elevation: 0,
                          color: KColors.KTextPrimaryColor,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimens.radiusMin)),
                          child: Padding(
                            padding:
                                const EdgeInsets.all(Dimens.basePaddingLarge),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CText(
                                      text: "Euro Wallet",
                                      textColor: KColors.KWhite,
                                      textSize: Dimens.title,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    CText(
                                      text: "Available Balance".toUpperCase(),
                                      textColor: KColors.KWhite,
                                      textSize: Dimens.titleMin,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4),
                                      child: CText(
                                        text: "$EURO_SYMBOL 2780,00",
                                        textColor: KColors.KWhite,
                                        textSize: Dimens.titleLarge,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Card(
                                    elevation: 0,
                                    margin: EdgeInsets.zero,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            Dimens.radiusMin),
                                        side: BorderSide(
                                            color: KColors.KBoarderColor)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        "assets/images/qr.png",
                                        fit: BoxFit.cover,
                                        height: 52,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Dimens.radiusMin),
                              bottomLeft: Radius.circular(Dimens.radiusMin),
                            ),
                            side: BorderSide(color: KColors.KBoarderColor)),
                        child: Padding(
                          padding:
                              const EdgeInsets.all(Dimens.basePaddingLarge),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CText(
                                    text: "USD Wallet",
                                    textColor: KColors.KTextPrimaryColor,
                                    textSize: Dimens.title,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  CText(
                                    text: "Available Balance".toUpperCase(),
                                    textColor: KColors.KHintTextColor,
                                    textSize: Dimens.titleMin,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 4),
                                    child: CText(
                                      text: "$EURO_SYMBOL 27,780,00",
                                      textColor: KColors.KBlack,
                                      textSize: Dimens.titleLarge,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimens.basePadding),
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.zero,
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.radiusMin),
                        side: BorderSide(color: KColors.KBoarderColor)),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/ic_pay.svg',
                                    height: 22,
                                    width: 22,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: CText(
                                      text: "Pay",
                                      textSize: Dimens.titleMid,
                                      fontWeight: FontWeight.w600,
                                      textColor: KColors.KBlack,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: VerticalDivider(
                              color: KColors.KBoarderColor,
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/ic_request.svg',
                                    height: 22,
                                    width: 22,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: CText(
                                      text: "Request",
                                      textSize: Dimens.titleMid,
                                      fontWeight: FontWeight.w600,
                                      textColor: KColors.KBlack,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: VerticalDivider(
                              color: KColors.KBoarderColor,
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/ic_deposite.svg',
                                    height: 22,
                                    width: 22,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: CText(
                                      text: "TopUp",
                                      textSize: Dimens.titleMid,
                                      fontWeight: FontWeight.w600,
                                      textColor: KColors.KBlack,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: VerticalDivider(
                              color: KColors.KBoarderColor,
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/ic_withdraw.svg',
                                    height: 22,
                                    width: 22,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: CText(
                                      text: "Withdraw",
                                      textSize: Dimens.titleMid,
                                      fontWeight: FontWeight.w600,
                                      textColor: KColors.KBlack,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(Dimens.basePadding),
                  child: Row(
                    children: [
                      Container(
                        height: 55,
                        child: Card(
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          color: KColors.KTabBGColor,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimens.radiusMin),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    color: KColors.KWhite,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 30),
                                      child: Center(
                                        child: CText(
                                          text: 'Recent',
                                          textSize: Dimens.title,
                                          textColor: KColors.KBlack,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 30),
                                  child: Center(
                                    child: CText(
                                      text: 'Pending',
                                      textSize: Dimens.title,
                                      textColor: KColors.KDarkNaviBlue,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      CText(
                        text: "View all",
                        textColor: Colors.black,
                        textSize: Dimens.titleMid,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                if (controller.dashboardResponse == null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: CenterCircularProgressBar(),
                  )
                else
                  Padding(
                    padding: EdgeInsets.all(Dimens.basePaddingLarge),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: [
                        CText(
                          text: "Today, 26 February",
                          textColor: Colors.black,
                          textSize: Dimens.titleLarge,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10),
                        Divider(
                          color: KColors.KBoarderColor,
                          height: 1,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: controller.dashboardResponse?.transactions
                              ?.transactionObject1?.length,
                          itemBuilder: (BuildContext context, int index) =>
                              TransactionItem(
                            onLongPressed:
                                (TransactionObject? transactionObject) =>
                                    controller.onTransactionLongPressed(),
                            transactionObject: controller.dashboardResponse
                                ?.transactions?.transactionObject1?[index],
                          ),
                        ),
                        SizedBox(height: 30),
                        CText(
                          text: "Today, 27 February",
                          textColor: Colors.black,
                          textSize: Dimens.titleLarge,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 10),
                        Divider(
                          color: KColors.KBoarderColor,
                          height: 1,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: controller.dashboardResponse?.transactions
                              ?.transactionObject2?.length,
                          itemBuilder: (BuildContext context, int index) =>
                              TransactionItem(
                            onLongPressed:
                                (TransactionObject? transactionObject) =>
                                    controller.onTransactionLongPressed(),
                            transactionObject: controller.dashboardResponse
                                ?.transactions?.transactionObject2?[index],
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            )));
  }
}

class TransactionItem extends StatelessWidget {
  TransactionObject? transactionObject;
  Function(TransactionObject? transactionObject) onLongPressed;

  TransactionItem(
      {required this.transactionObject, required this.onLongPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => onLongPressed(transactionObject),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: NetworkImageComponenet(
                          imageUrl: "${transactionObject?.picture}"),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: KColors.KTextPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: SvgPicture.asset(
                                'assets/icons/ic_right_arrow.svg',
                                fit: BoxFit.cover,
                                width: 8,
                                height: 8,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CText(
                        text: "${transactionObject?.title}",
                        textSize: Dimens.titleLarge,
                        fontWeight: FontWeight.w600,
                        textColor: KColors.KBlack,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: CText(
                          text: "Type : ${transactionObject?.type}",
                          textSize: Dimens.titleMid,
                          textColor: KColors.KDescriptionColor,
                        ),
                      )
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CText(
                        text:
                            "+ ${transactionObject?.currencySym} ${transactionObject?.balance}",
                        textSize: Dimens.titleLarge,
                        fontWeight: FontWeight.w600,
                        textColor: KColors.KBlack,
                      ),
                      Card(
                        elevation: 0,
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimens.radiusNone),
                            side: BorderSide(
                                color:
                                    transactionObject?.status?.toLowerCase() ==
                                            "approved"
                                        ? Colors.green
                                        : transactionObject?.status
                                                    ?.toLowerCase() ==
                                                "pending"
                                            ? Colors.deepOrangeAccent
                                            : Colors.red,
                                width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 3),
                          child: CText(
                            text: "${transactionObject?.status}",
                            textSize: Dimens.titleMid,
                            textColor: transactionObject?.status
                                        ?.toLowerCase() ==
                                    "approved"
                                ? Colors.green
                                : transactionObject?.status?.toLowerCase() ==
                                        "pending"
                                    ? Colors.deepOrangeAccent
                                    : Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: KColors.KBoarderColor,
            height: 1,
          ),
        ],
      ),
    );
  }
}
