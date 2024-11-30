class ProductDetailModel {
  String? title;
  String? message;
  Data? data;

  ProductDetailModel({this.title, this.message, this.data});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? slug;
  Category? category;
  Brand? brand;
  String? title;
  String? ingredient;
  String? howToUse;
  String? description;
  int? price;
  int? rewardPoint;
  int? commissionPercentage;
  int? strikePrice;
  int? offPercent;
  int? minOrder;
  int? maxOrder;
  bool? status;
  List<String>? images;
  List<ColorAttributes>? colorAttributes;
  // List<Null>? sizeAttributes;
  String? variantType;
  List<ColorVariants>? colorVariants;
  int? ratings;
  int? totalRatings;
  int? ratedBy;
  FilterOptions? filterOptions;
  String? metaRobots;
  bool? isTodaysDeal;
  bool? isFeatured;
  bool? isPublished;
  String? searchWords;
  bool? isDeleted;
  // List<Null>? sizeVariants;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? noneText;
  List<BreadCrums>? breadCrums;
  bool? wished;

  Data({
    this.sId,
    this.slug,
    this.category,
    this.brand,
    this.title,
    this.ingredient,
    this.howToUse,
    this.description,
    this.price,
    this.rewardPoint,
    this.commissionPercentage,
    this.strikePrice,
    this.offPercent,
    this.minOrder,
    this.maxOrder,
    this.status,
    this.images,
    this.colorAttributes,
    // this.sizeAttributes,
    this.variantType,
    this.colorVariants,
    this.ratings,
    this.totalRatings,
    this.ratedBy,
    this.filterOptions,
    this.metaRobots,
    this.isTodaysDeal,
    this.isFeatured,
    this.isPublished,
    this.searchWords,
    this.isDeleted,
    // this.sizeVariants,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.noneText,
    this.breadCrums,
    this.wished,
  });

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    title = json['title'];
    ingredient = json['ingredient'];
    howToUse = json['howToUse'];
    description = json['description'];
    price = json['price'];
    rewardPoint = json['rewardPoint'];
    commissionPercentage = json['commissionPercentage'];
    strikePrice = json['strikePrice'];
    offPercent = json['offPercent'];
    minOrder = json['minOrder'];
    maxOrder = json['maxOrder'];
    status = json['status'];
    images = json['images'].cast<String>();
    if (json['colorAttributes'] != null) {
      colorAttributes = <ColorAttributes>[];
      json['colorAttributes'].forEach((v) {
        colorAttributes!.add(ColorAttributes.fromJson(v));
      });
    }
    // if (json['sizeAttributes'] != null) {
    //   sizeAttributes = <Null>[];
    //   json['sizeAttributes'].forEach((v) {
    //     sizeAttributes!.add(Null.fromJson(v));
    //   });
    // }
    variantType = json['variantType'];
    if (json['colorVariants'] != null) {
      colorVariants = <ColorVariants>[];
      json['colorVariants'].forEach((v) {
        colorVariants!.add(ColorVariants.fromJson(v));
      });
    }
    ratings = json['ratings'];
    totalRatings = json['totalRatings'];
    ratedBy = json['ratedBy'];
    filterOptions = json['filterOptions'] != null
        ? FilterOptions.fromJson(json['filterOptions'])
        : null;
    metaRobots = json['metaRobots'];
    isTodaysDeal = json['isTodaysDeal'];
    isFeatured = json['isFeatured'];
    isPublished = json['isPublished'];
    searchWords = json['searchWords'];
    isDeleted = json['isDeleted'];
    // if (json['sizeVariants'] != null) {
    //   sizeVariants = <Null>[];
    //   json['sizeVariants'].forEach((v) {
    //     sizeVariants!.add(Null.fromJson(v));
    //   });
    // }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    noneText = json['noneText'];
    if (json['breadCrums'] != null) {
      breadCrums = <BreadCrums>[];
      json['breadCrums'].forEach((v) {
        breadCrums!.add(BreadCrums.fromJson(v));
      });
    }
    wished = json['wished'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['slug'] = slug;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['title'] = title;
    data['ingredient'] = ingredient;
    data['howToUse'] = howToUse;
    data['description'] = description;
    data['price'] = price;
    data['rewardPoint'] = rewardPoint;
    data['commissionPercentage'] = commissionPercentage;
    data['strikePrice'] = strikePrice;
    data['offPercent'] = offPercent;
    data['minOrder'] = minOrder;
    data['maxOrder'] = maxOrder;
    data['status'] = status;
    data['images'] = images;
    if (colorAttributes != null) {
      data['colorAttributes'] =
          colorAttributes!.map((v) => v.toJson()).toList();
    }
    // if (sizeAttributes != null) {
    //   data['sizeAttributes'] =
    //       sizeAttributes!.map((v) => v.toJson()).toList();
    // }
    data['variantType'] = variantType;
    if (colorVariants != null) {
      data['colorVariants'] = colorVariants!.map((v) => v.toJson()).toList();
    }
    data['ratings'] = ratings;
    data['totalRatings'] = totalRatings;
    data['ratedBy'] = ratedBy;
    if (filterOptions != null) {
      data['filterOptions'] = filterOptions!.toJson();
    }
    data['metaRobots'] = metaRobots;
    data['isTodaysDeal'] = isTodaysDeal;
    data['isFeatured'] = isFeatured;
    data['isPublished'] = isPublished;
    data['searchWords'] = searchWords;
    data['isDeleted'] = isDeleted;
    // if (sizeVariants != null) {
    //   data['sizeVariants'] = sizeVariants!.map((v) => v.toJson()).toList();
    // }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['noneText'] = noneText;
    if (breadCrums != null) {
      data['breadCrums'] = breadCrums!.map((v) => v.toJson()).toList();
    }
    data['wished'] = wished;
    return data;
  }
}

class Category {
  String? sId;
  String? slug;
  String? title;
  int? level;
  String? parentId;

  Category({
    this.sId,
    this.slug,
    this.title,
    this.level,
    this.parentId,
  });

  Category.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    title = json['title'];
    level = json['level'];
    parentId = json['parentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['slug'] = slug;
    data['title'] = title;
    data['level'] = level;
    data['parentId'] = parentId;
    return data;
  }
}

class Brand {
  String? sId;
  String? slug;
  String? name;

  Brand({
    this.sId,
    this.slug,
    this.name,
  });

  Brand.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    slug = json['slug'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['slug'] = slug;
    data['name'] = name;
    return data;
  }
}

class ColorAttributes {
  String? sId;
  bool? isTwin;
  String? name;
  List<String>? colorValue;

  ColorAttributes({
    this.sId,
    this.isTwin,
    this.name,
    this.colorValue,
  });

  ColorAttributes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    isTwin = json['isTwin'];
    name = json['name'];
    colorValue = json['colorValue'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['isTwin'] = isTwin;
    data['name'] = name;
    data['colorValue'] = colorValue;
    return data;
  }
}

class ColorVariants {
  ColorAttributes? color;
  int? price;
  int? rewardPoint;
  int? strikePrice;
  int? offPercent;
  int? minOrder;
  int? maxOrder;
  bool? status;
  // List<Null>? images;
  String? productCode;
  String? sId;

  ColorVariants({
    this.color,
    this.price,
    this.rewardPoint,
    this.strikePrice,
    this.offPercent,
    this.minOrder,
    this.maxOrder,
    this.status,
    // this.images,
    this.productCode,
    this.sId,
  });

  ColorVariants.fromJson(Map<String, dynamic> json) {
    color =
        json['color'] != null ? ColorAttributes.fromJson(json['color']) : null;
    price = json['price'];
    rewardPoint = json['rewardPoint'];
    strikePrice = json['strikePrice'];
    offPercent = json['offPercent'];
    minOrder = json['minOrder'];
    maxOrder = json['maxOrder'];
    status = json['status'];
    // if (json['images'] != null) {
    //   images = <Null>[];
    //   json['images'].forEach((v) {
    //     images!.add(Null.fromJson(v));
    //   });
    // }
    productCode = json['productCode'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (color != null) {
      data['color'] = color!.toJson();
    }
    data['price'] = price;
    data['rewardPoint'] = rewardPoint;
    data['strikePrice'] = strikePrice;
    data['offPercent'] = offPercent;
    data['minOrder'] = minOrder;
    data['maxOrder'] = maxOrder;
    data['status'] = status;
    // if (images != null) {
    //   data['images'] = images!.map((v) => v.toJson()).toList();
    // }
    data['productCode'] = productCode;
    data['_id'] = sId;
    return data;
  }
}

class FilterOptions {
  bool? age12;
  bool? age20;
  bool? age30;
  bool? age40;
  bool? age50;
  bool? benefitsAntiAgeing;
  bool? benefitsAntiShine;
  bool? benefitsBrightning;
  bool? benefitsBronzing;
  bool? benefitsCooling;
  bool? benefitsConcealing;
  bool? benefitsConditioning;
  bool? benefitsCurling;
  bool? benefitsDefining;
  bool? benefitsEnergising;
  bool? benefitsEvenSkinTone;
  bool? benefitsExfoliating;
  bool? benefitsFilling;
  bool? benefitsGrowthBoosting;
  bool? benefitsHydrating;
  bool? benefitsLengthening;
  bool? benefitsLongLasting;
  bool? benefitsMattifing;
  bool? benefitsMoisturing;
  bool? benefitsNourishing;
  bool? benefitsProtecting;
  bool? benefitsQuickDry;
  bool? benefitsRevitalising;
  bool? benefitsSculpting;
  bool? benefitsSmoothing;
  bool? benefitsThickening;
  bool? benefitsTransferProof;
  bool? benefitsVolumising;
  bool? benefitsWaterproof;
  bool? colorRed;
  String? colorRedHex;
  bool? colorBlue;
  String? colorBlueHex;
  bool? colorPink;
  String? colorPinkHex;
  bool? colorBlack;
  String? colorBlackHex;
  bool? colorBrown;
  String? colorBrownHex;
  bool? colorGrey;
  String? colorGreyHex;
  bool? colorGreen;
  String? colorGreenHex;
  bool? colorBurgundy;
  String? colorBurgundyHex;
  bool? colorPurple;
  String? colorPurpleHex;
  bool? coverageHigh;
  bool? coverageLight;
  bool? coverageMedium;
  bool? finishCreamy;
  bool? finishGlossy;
  bool? finishLuminious;
  bool? finishMalte;
  bool? finishMetaallic;
  bool? finishNatural;
  bool? finishSatin;
  bool? finishSheer;
  bool? finishShimmer;
  bool? finishShine;
  bool? formulationGel;
  bool? formulationLiquid;
  bool? formulationPencil;
  bool? formulationPowder;
  bool? formulationStick;
  bool? formulationWax;
  bool? formulationCream;
  bool? formulationLipBalm;
  bool? formulationLoose;
  bool? formulationPearls;
  bool? formulationPressed;
  bool? formulationSerum;
  bool? skinTypeCombination;
  bool? skinTypeDry;
  bool? skinTypeNormal;
  bool? skinTypeOily;
  bool? skinTypeSensitive;

  FilterOptions({
    this.age12,
    this.age20,
    this.age30,
    this.age40,
    this.age50,
    this.benefitsAntiAgeing,
    this.benefitsAntiShine,
    this.benefitsBrightning,
    this.benefitsBronzing,
    this.benefitsCooling,
    this.benefitsConcealing,
    this.benefitsConditioning,
    this.benefitsCurling,
    this.benefitsDefining,
    this.benefitsEnergising,
    this.benefitsEvenSkinTone,
    this.benefitsExfoliating,
    this.benefitsFilling,
    this.benefitsGrowthBoosting,
    this.benefitsHydrating,
    this.benefitsLengthening,
    this.benefitsLongLasting,
    this.benefitsMattifing,
    this.benefitsMoisturing,
    this.benefitsNourishing,
    this.benefitsProtecting,
    this.benefitsQuickDry,
    this.benefitsRevitalising,
    this.benefitsSculpting,
    this.benefitsSmoothing,
    this.benefitsThickening,
    this.benefitsTransferProof,
    this.benefitsVolumising,
    this.benefitsWaterproof,
    this.colorRed,
    this.colorRedHex,
    this.colorBlue,
    this.colorBlueHex,
    this.colorPink,
    this.colorPinkHex,
    this.colorBlack,
    this.colorBlackHex,
    this.colorBrown,
    this.colorBrownHex,
    this.colorGrey,
    this.colorGreyHex,
    this.colorGreen,
    this.colorGreenHex,
    this.colorBurgundy,
    this.colorBurgundyHex,
    this.colorPurple,
    this.colorPurpleHex,
    this.coverageHigh,
    this.coverageLight,
    this.coverageMedium,
    this.finishCreamy,
    this.finishGlossy,
    this.finishLuminious,
    this.finishMalte,
    this.finishMetaallic,
    this.finishNatural,
    this.finishSatin,
    this.finishSheer,
    this.finishShimmer,
    this.finishShine,
    this.formulationGel,
    this.formulationLiquid,
    this.formulationPencil,
    this.formulationPowder,
    this.formulationStick,
    this.formulationWax,
    this.formulationCream,
    this.formulationLipBalm,
    this.formulationLoose,
    this.formulationPearls,
    this.formulationPressed,
    this.formulationSerum,
    this.skinTypeCombination,
    this.skinTypeDry,
    this.skinTypeNormal,
    this.skinTypeOily,
    this.skinTypeSensitive,
  });

  FilterOptions.fromJson(Map<String, dynamic> json) {
    age12 = json['age_12'];
    age20 = json['age_20'];
    age30 = json['age_30'];
    age40 = json['age_40'];
    age50 = json['age_50'];
    benefitsAntiAgeing = json['benefits_anti_ageing'];
    benefitsAntiShine = json['benefits_anti_shine'];
    benefitsBrightning = json['benefits_brightning'];
    benefitsBronzing = json['benefits_bronzing'];
    benefitsCooling = json['benefits_cooling'];
    benefitsConcealing = json['benefits_concealing'];
    benefitsConditioning = json['benefits_conditioning'];
    benefitsCurling = json['benefits_curling'];
    benefitsDefining = json['benefits_defining'];
    benefitsEnergising = json['benefits_energising'];
    benefitsEvenSkinTone = json['benefits_even_skin_tone'];
    benefitsExfoliating = json['benefits_exfoliating'];
    benefitsFilling = json['benefits_filling'];
    benefitsGrowthBoosting = json['benefits_growth_boosting'];
    benefitsHydrating = json['benefits_hydrating'];
    benefitsLengthening = json['benefits_lengthening'];
    benefitsLongLasting = json['benefits_long_lasting'];
    benefitsMattifing = json['benefits_mattifing'];
    benefitsMoisturing = json['benefits_moisturing'];
    benefitsNourishing = json['benefits_nourishing'];
    benefitsProtecting = json['benefits_protecting'];
    benefitsQuickDry = json['benefits_quick_dry'];
    benefitsRevitalising = json['benefits_revitalising'];
    benefitsSculpting = json['benefits_sculpting'];
    benefitsSmoothing = json['benefits_smoothing'];
    benefitsThickening = json['benefits_thickening'];
    benefitsTransferProof = json['benefits_transfer_proof'];
    benefitsVolumising = json['benefits_volumising'];
    benefitsWaterproof = json['benefits_waterproof'];
    colorRed = json['color_red'];
    colorRedHex = json['color_red_hex'];
    colorBlue = json['color_blue'];
    colorBlueHex = json['color_blue_hex'];
    colorPink = json['color_pink'];
    colorPinkHex = json['color_pink_hex'];
    colorBlack = json['color_black'];
    colorBlackHex = json['color_black_hex'];
    colorBrown = json['color_brown'];
    colorBrownHex = json['color_brown_hex'];
    colorGrey = json['color_grey'];
    colorGreyHex = json['color_grey_hex'];
    colorGreen = json['color_green'];
    colorGreenHex = json['color_green_hex'];
    colorBurgundy = json['color_burgundy'];
    colorBurgundyHex = json['color_burgundy_hex'];
    colorPurple = json['color_purple'];
    colorPurpleHex = json['color_purple_hex'];
    coverageHigh = json['coverage_high'];
    coverageLight = json['coverage_light'];
    coverageMedium = json['coverage_medium'];
    finishCreamy = json['finish_creamy'];
    finishGlossy = json['finish_glossy'];
    finishLuminious = json['finish_luminious'];
    finishMalte = json['finish_malte'];
    finishMetaallic = json['finish_metaallic'];
    finishNatural = json['finish_natural'];
    finishSatin = json['finish_satin'];
    finishSheer = json['finish_sheer'];
    finishShimmer = json['finish_shimmer'];
    finishShine = json['finish_shine'];
    formulationGel = json['formulation_gel'];
    formulationLiquid = json['formulation_liquid'];
    formulationPencil = json['formulation_pencil'];
    formulationPowder = json['formulation_powder'];
    formulationStick = json['formulation_stick'];
    formulationWax = json['formulation_wax'];
    formulationCream = json['formulation_cream'];
    formulationLipBalm = json['formulation_lip_balm'];
    formulationLoose = json['formulation_loose'];
    formulationPearls = json['formulation_pearls'];
    formulationPressed = json['formulation_pressed'];
    formulationSerum = json['formulation_serum'];
    skinTypeCombination = json['skin_type_combination'];
    skinTypeDry = json['skin_type_dry'];
    skinTypeNormal = json['skin_type_normal'];
    skinTypeOily = json['skin_type_oily'];
    skinTypeSensitive = json['skin_type_sensitive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age_12'] = age12;
    data['age_20'] = age20;
    data['age_30'] = age30;
    data['age_40'] = age40;
    data['age_50'] = age50;
    data['benefits_anti_ageing'] = benefitsAntiAgeing;
    data['benefits_anti_shine'] = benefitsAntiShine;
    data['benefits_brightning'] = benefitsBrightning;
    data['benefits_bronzing'] = benefitsBronzing;
    data['benefits_cooling'] = benefitsCooling;
    data['benefits_concealing'] = benefitsConcealing;
    data['benefits_conditioning'] = benefitsConditioning;
    data['benefits_curling'] = benefitsCurling;
    data['benefits_defining'] = benefitsDefining;
    data['benefits_energising'] = benefitsEnergising;
    data['benefits_even_skin_tone'] = benefitsEvenSkinTone;
    data['benefits_exfoliating'] = benefitsExfoliating;
    data['benefits_filling'] = benefitsFilling;
    data['benefits_growth_boosting'] = benefitsGrowthBoosting;
    data['benefits_hydrating'] = benefitsHydrating;
    data['benefits_lengthening'] = benefitsLengthening;
    data['benefits_long_lasting'] = benefitsLongLasting;
    data['benefits_mattifing'] = benefitsMattifing;
    data['benefits_moisturing'] = benefitsMoisturing;
    data['benefits_nourishing'] = benefitsNourishing;
    data['benefits_protecting'] = benefitsProtecting;
    data['benefits_quick_dry'] = benefitsQuickDry;
    data['benefits_revitalising'] = benefitsRevitalising;
    data['benefits_sculpting'] = benefitsSculpting;
    data['benefits_smoothing'] = benefitsSmoothing;
    data['benefits_thickening'] = benefitsThickening;
    data['benefits_transfer_proof'] = benefitsTransferProof;
    data['benefits_volumising'] = benefitsVolumising;
    data['benefits_waterproof'] = benefitsWaterproof;
    data['color_red'] = colorRed;
    data['color_red_hex'] = colorRedHex;
    data['color_blue'] = colorBlue;
    data['color_blue_hex'] = colorBlueHex;
    data['color_pink'] = colorPink;
    data['color_pink_hex'] = colorPinkHex;
    data['color_black'] = colorBlack;
    data['color_black_hex'] = colorBlackHex;
    data['color_brown'] = colorBrown;
    data['color_brown_hex'] = colorBrownHex;
    data['color_grey'] = colorGrey;
    data['color_grey_hex'] = colorGreyHex;
    data['color_green'] = colorGreen;
    data['color_green_hex'] = colorGreenHex;
    data['color_burgundy'] = colorBurgundy;
    data['color_burgundy_hex'] = colorBurgundyHex;
    data['color_purple'] = colorPurple;
    data['color_purple_hex'] = colorPurpleHex;
    data['coverage_high'] = coverageHigh;
    data['coverage_light'] = coverageLight;
    data['coverage_medium'] = coverageMedium;
    data['finish_creamy'] = finishCreamy;
    data['finish_glossy'] = finishGlossy;
    data['finish_luminious'] = finishLuminious;
    data['finish_malte'] = finishMalte;
    data['finish_metaallic'] = finishMetaallic;
    data['finish_natural'] = finishNatural;
    data['finish_satin'] = finishSatin;
    data['finish_sheer'] = finishSheer;
    data['finish_shimmer'] = finishShimmer;
    data['finish_shine'] = finishShine;
    data['formulation_gel'] = formulationGel;
    data['formulation_liquid'] = formulationLiquid;
    data['formulation_pencil'] = formulationPencil;
    data['formulation_powder'] = formulationPowder;
    data['formulation_stick'] = formulationStick;
    data['formulation_wax'] = formulationWax;
    data['formulation_cream'] = formulationCream;
    data['formulation_lip_balm'] = formulationLipBalm;
    data['formulation_loose'] = formulationLoose;
    data['formulation_pearls'] = formulationPearls;
    data['formulation_pressed'] = formulationPressed;
    data['formulation_serum'] = formulationSerum;
    data['skin_type_combination'] = skinTypeCombination;
    data['skin_type_dry'] = skinTypeDry;
    data['skin_type_normal'] = skinTypeNormal;
    data['skin_type_oily'] = skinTypeOily;
    data['skin_type_sensitive'] = skinTypeSensitive;
    return data;
  }
}

class BreadCrums {
  String? title;
  String? slug;

  BreadCrums({
    this.title,
    this.slug,
  });

  BreadCrums.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['slug'] = slug;
    return data;
  }
}
