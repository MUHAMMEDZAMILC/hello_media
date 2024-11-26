import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_media/model/categorymodel.dart';
import 'package:hello_media/utils/helper/help_loader.dart';
import 'package:hello_media/utils/helper/help_screensize.dart';
import 'package:hello_media/utils/helper/pagenavigator.dart';
import 'package:hello_media/utils/theme/colors.dart';
import 'package:hello_media/utils/theme/dimensions.dart';
import 'package:hello_media/utils/theme/theme_data.dart';
import 'package:hello_media/view/components/appsvg.dart';
import 'package:hello_media/view/components/apptext.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/provideroperation.dart';
import '../../../utils/string.dart';

class UploadFeedScreen extends StatefulWidget {
  const UploadFeedScreen({super.key});

  @override
  State<UploadFeedScreen> createState() => _UploadFeedScreenState();
}

class _UploadFeedScreenState extends State<UploadFeedScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? image, video;
  List<int> selectedcate = [];
  @override
  void initState() {
    Provider.of<ProviderOperation>(context, listen: false).getcate(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ProviderOperation>(context, listen: false);
    final liveservice = Provider.of<ProviderOperation>(context, listen: true);
    ScreenUtil.init(context);
    return liveservice.ispageloading
        ? const PageEntryLoader()
        : Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Screen.close(context);
                  },
                  icon: AppSvg(assetName: leftroundedarrowsvg)),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: 'Add Feed',
                    color: ColorResources.WHITE,
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.3),
                        color: primarycolor.withOpacity(0.06),
                        border: Border.all(
                            color: primarycolor.withOpacity(0.4), width: 0.84)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: padding, horizontal: paddingLarge),
                      child: AppText(
                        text: 'Share Feed',
                        weight: FontWeight.w400,
                        size: 13,
                        color: ColorResources.WHITE,
                      ),
                    ),
                  )
                ],
              ),
            ),
            body: SizedBox(
              width: ScreenUtil.screenWidth,
              height: ScreenUtil.screenHeight,
              child: Padding(
                padding: const EdgeInsets.all(paddingLarge),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () async {
                          video = await picker.pickVideo(
                              source: ImageSource.gallery);
                          setState(() {});
                        },
                        child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10.48),
                            dashPattern: const [10, 10],
                            color: ColorResources.WHITE.withOpacity(0.8),
                            strokeWidth: 0.34,
                            child: SizedBox(
                              width: ScreenUtil.screenWidth,
                              height: ScreenUtil.screenHeight! * 0.3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppSvg(assetName: uploadvideoic),
                                  gap,
                                  AppText(
                                    text: video != null
                                        ? '${video?.name} Selected'
                                        : 'Select a Video From Gallery',
                                    weight: FontWeight.w400,
                                    size: 15,
                                    color: ColorResources.WHITE,
                                  )
                                ],
                              ),
                            )),
                      ),
                      gap26,
                      InkWell(
                        onTap: () async {
                          image = await picker.pickImage(
                              source: ImageSource.gallery);
                          setState(() {});
                        },
                        child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10.48),
                            dashPattern: const [10, 10],
                            color: ColorResources.WHITE.withOpacity(0.8),
                            strokeWidth: 0.34,
                            child: SizedBox(
                              width: ScreenUtil.screenWidth,
                              height: ScreenUtil.screenHeight! * 0.2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppSvg(assetName: uploadimgic),
                                  gapHorizontalLarge,
                                  AppText(
                                    text: image != null
                                        ? '${image?.name} Selected'
                                        : 'Add a Thumbnail',
                                    weight: FontWeight.w400,
                                    size: 15,
                                    color: ColorResources.WHITE,
                                  )
                                ],
                              ),
                            )),
                      ),
                      gap26,
                      AppText(
                        text: 'Add Description',
                        weight: FontWeight.w500,
                        color: ColorResources.WHITE.withOpacity(0.9),
                        size: 14,
                      ),
                      gap,
                      AppText(
                        text:
                            'Lorem ipsum dolor sit amet consectetur. Leo ac lorem faucli bus facilisis tellus. At vitae dis commodo nunc sollicitudin elementum suspendisse...Lorem ipsum dolor sit amet consectetur. Leo ac lorem faucli bus facilisis tellus. At vitae dis commodo nunc sollicitudin elementum suspendisse...',
                        weight: FontWeight.w300,
                        size: 11,
                        color: ColorResources.WHITE.withOpacity(0.6),
                      ),
                      gap26,
                      AppText(
                        text: 'Categories This Project',
                        weight: FontWeight.w500,
                        color: ColorResources.WHITE.withOpacity(0.9),
                        size: 14,
                      ),
                      gap,
                      GridView.builder(
                        itemCount: liveservice.categorieslist.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 1 / 0.3,
                                crossAxisSpacing: padding,
                                mainAxisSpacing: padding),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Category data = liveservice.categorieslist[index];
                          return InkWell(
                            onTap: () {
                              if (data.id != null) {
                                if (selectedcate.contains(data.id)) {
                                  selectedcate.remove(data.id);
                                } else {
                                  selectedcate.add(data.id ?? 0);
                                }
                              }
                              setState(() {});
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17.3),
                                  color: selectedcate.contains(data.id)
                                      ? primarycolor.withOpacity(0.06)
                                      : null,
                                  border: Border.all(
                                      color: primarycolor.withOpacity(0.4),
                                      width: 0.84)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: padding,
                                    horizontal: paddingLarge),
                                child: AppText(
                                  text: data.title ?? '',
                                  weight: FontWeight.w400,
                                  size: 13,
                                  color: ColorResources.WHITE,
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
