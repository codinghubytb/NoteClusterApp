; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [140 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [280 x i32] [
	i32 42639949, ; 0: System.Threading.Thread => 0x28aa24d => 130
	i32 67008169, ; 1: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 2: Microsoft.Maui.Graphics.dll => 0x44bb714 => 60
	i32 117431740, ; 3: System.Runtime.InteropServices => 0x6ffddbc => 122
	i32 165246403, ; 4: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 70
	i32 182336117, ; 5: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 88
	i32 195452805, ; 6: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 7: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 8: System.ComponentModel => 0xc38ff48 => 103
	i32 254259026, ; 9: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 37
	i32 280992041, ; 10: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 11: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 12: Xamarin.AndroidX.Activity.dll => 0x13031348 => 66
	i32 336156722, ; 13: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 14: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 77
	i32 347068432, ; 15: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0x14afd810 => 64
	i32 356389973, ; 16: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 17: System.Threading.Thread.dll => 0x16a510e1 => 130
	i32 385762202, ; 18: System.Memory.dll => 0x16fe439a => 112
	i32 395744057, ; 19: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 20: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 21: System.Collections => 0x1a61054f => 100
	i32 450948140, ; 22: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 76
	i32 459347974, ; 23: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 124
	i32 469710990, ; 24: System.dll => 0x1bff388e => 134
	i32 498788369, ; 25: System.ObjectModel => 0x1dbae811 => 117
	i32 500358224, ; 26: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 27: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 28: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 54
	i32 539058512, ; 29: Microsoft.Extensions.Logging => 0x20216150 => 51
	i32 571435654, ; 30: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 48
	i32 592146354, ; 31: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 597488923, ; 32: CommunityToolkit.Maui => 0x239cf51b => 35
	i32 627609679, ; 33: Xamarin.AndroidX.CustomView => 0x2568904f => 74
	i32 627931235, ; 34: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 35: System.Text.Encodings.Web.dll => 0x27787397 => 127
	i32 672442732, ; 36: System.Collections.Concurrent => 0x2814a96c => 96
	i32 688181140, ; 37: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 38: System.Xml.Linq.dll => 0x29293ff5 => 132
	i32 706645707, ; 39: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 40: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 41: System.Runtime.Loader.dll => 0x2b15ed29 => 123
	i32 748832960, ; 42: SQLitePCLRaw.batteries_v2 => 0x2ca248c0 => 62
	i32 759454413, ; 43: System.Net.Requests => 0x2d445acd => 115
	i32 775507847, ; 44: System.IO.Compression => 0x2e394f87 => 108
	i32 777317022, ; 45: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 46: Microsoft.Extensions.Options => 0x2f0980eb => 53
	i32 804008546, ; 47: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 41
	i32 823281589, ; 48: System.Private.Uri.dll => 0x311247b5 => 118
	i32 830298997, ; 49: System.IO.Compression.Brotli => 0x317d5b75 => 107
	i32 855100809, ; 50: NoteClusterWebApp => 0x32f7cd89 => 95
	i32 904024072, ; 51: System.ComponentModel.Primitives.dll => 0x35e25008 => 101
	i32 926902833, ; 52: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 967690846, ; 53: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 77
	i32 992768348, ; 54: System.Collections.dll => 0x3b2c715c => 100
	i32 999186168, ; 55: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 50
	i32 1012816738, ; 56: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 87
	i32 1028951442, ; 57: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 45
	i32 1029334545, ; 58: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 59: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 67
	i32 1044663988, ; 60: System.Linq.Expressions.dll => 0x3e444eb4 => 110
	i32 1052210849, ; 61: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 79
	i32 1082857460, ; 62: System.ComponentModel.TypeConverter => 0x408b17f4 => 102
	i32 1084122840, ; 63: Xamarin.Kotlin.StdLib => 0x409e66d8 => 92
	i32 1098259244, ; 64: System => 0x41761b2c => 134
	i32 1118262833, ; 65: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 66: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1173126369, ; 67: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 46
	i32 1178241025, ; 68: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 84
	i32 1203215381, ; 69: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1234928153, ; 70: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 71: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1292207520, ; 72: SQLitePCLRaw.core.dll => 0x4d0585a0 => 63
	i32 1293217323, ; 73: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 75
	i32 1324164729, ; 74: System.Linq => 0x4eed2679 => 111
	i32 1373134921, ; 75: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 76: Xamarin.AndroidX.SavedState => 0x52114ed3 => 87
	i32 1406073936, ; 77: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 71
	i32 1421294233, ; 78: LibraryComponent.dll => 0x54b73a99 => 94
	i32 1430672901, ; 79: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1454105418, ; 80: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 47
	i32 1461004990, ; 81: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1461234159, ; 82: System.Collections.Immutable.dll => 0x5718a9ef => 97
	i32 1462112819, ; 83: System.IO.Compression.dll => 0x57261233 => 108
	i32 1469204771, ; 84: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 68
	i32 1470490898, ; 85: Microsoft.Extensions.Primitives => 0x57a5e912 => 54
	i32 1479771757, ; 86: System.Collections.Immutable => 0x5833866d => 97
	i32 1480492111, ; 87: System.IO.Compression.Brotli.dll => 0x583e844f => 107
	i32 1493001747, ; 88: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 89: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1521091094, ; 90: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 50
	i32 1543031311, ; 91: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 129
	i32 1546581739, ; 92: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 41
	i32 1551623176, ; 93: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 94: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 81
	i32 1624863272, ; 95: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 90
	i32 1634654947, ; 96: CommunityToolkit.Maui.Core.dll => 0x616edae3 => 36
	i32 1636350590, ; 97: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 73
	i32 1639515021, ; 98: System.Net.Http.dll => 0x61b9038d => 113
	i32 1639986890, ; 99: System.Text.RegularExpressions => 0x61c036ca => 129
	i32 1654881142, ; 100: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 40
	i32 1657153582, ; 101: System.Runtime => 0x62c6282e => 125
	i32 1658251792, ; 102: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 91
	i32 1677501392, ; 103: System.Net.Primitives.dll => 0x63fca3d0 => 114
	i32 1679769178, ; 104: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1711441057, ; 105: SQLitePCLRaw.lib.e_sqlite3.android => 0x660284a1 => 64
	i32 1729485958, ; 106: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 69
	i32 1736233607, ; 107: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 108: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1760259689, ; 109: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 39
	i32 1763938596, ; 110: System.Diagnostics.TraceSource.dll => 0x69239124 => 106
	i32 1766324549, ; 111: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 88
	i32 1770582343, ; 112: Microsoft.Extensions.Logging.dll => 0x6988f147 => 51
	i32 1780572499, ; 113: Mono.Android.Runtime.dll => 0x6a216153 => 138
	i32 1782862114, ; 114: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 115: Xamarin.AndroidX.Fragment => 0x6a96652d => 76
	i32 1793755602, ; 116: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 117: Xamarin.AndroidX.Loader => 0x6bcd3296 => 81
	i32 1813058853, ; 118: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 92
	i32 1813201214, ; 119: Xamarin.Google.Android.Material => 0x6c13413e => 91
	i32 1818569960, ; 120: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 85
	i32 1828688058, ; 121: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 52
	i32 1842015223, ; 122: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 123: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 124: System.Linq.Expressions => 0x6ec71a65 => 110
	i32 1875935024, ; 125: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1910275211, ; 126: System.Collections.NonGeneric.dll => 0x71dc7c8b => 98
	i32 1939592360, ; 127: System.Private.Xml.Linq => 0x739bd4a8 => 119
	i32 1968388702, ; 128: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 42
	i32 2003115576, ; 129: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 130: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 79
	i32 2025202353, ; 131: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 132: System.Private.Xml => 0x79eb68ee => 120
	i32 2055257422, ; 133: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 78
	i32 2066184531, ; 134: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 135: System.Diagnostics.TraceSource => 0x7b6f419e => 106
	i32 2072397586, ; 136: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 49
	i32 2079903147, ; 137: System.Runtime.dll => 0x7bf8cdab => 125
	i32 2090596640, ; 138: System.Numerics.Vectors => 0x7c9bf920 => 116
	i32 2103459038, ; 139: SQLitePCLRaw.provider.e_sqlite3.dll => 0x7d603cde => 65
	i32 2127167465, ; 140: System.Console => 0x7ec9ffe9 => 104
	i32 2142473426, ; 141: System.Collections.Specialized => 0x7fb38cd2 => 99
	i32 2159891885, ; 142: Microsoft.Maui => 0x80bd55ad => 58
	i32 2169148018, ; 143: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 144: Microsoft.Extensions.Options.dll => 0x820d22b3 => 53
	i32 2192057212, ; 145: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 52
	i32 2193016926, ; 146: System.ObjectModel.dll => 0x82b6c85e => 117
	i32 2201107256, ; 147: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 93
	i32 2201231467, ; 148: System.Net.Http => 0x8334206b => 113
	i32 2207618523, ; 149: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2266799131, ; 150: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 43
	i32 2270573516, ; 151: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 152: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 86
	i32 2303942373, ; 153: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 154: System.Private.CoreLib.dll => 0x896b7878 => 136
	i32 2340441535, ; 155: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 121
	i32 2353062107, ; 156: System.Net.Primitives => 0x8c40e0db => 114
	i32 2368005991, ; 157: System.Xml.ReaderWriter.dll => 0x8d24e767 => 133
	i32 2371007202, ; 158: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 42
	i32 2395872292, ; 159: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2411328690, ; 160: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 37
	i32 2427813419, ; 161: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2435356389, ; 162: System.Console.dll => 0x912896e5 => 104
	i32 2442556106, ; 163: Microsoft.JSInterop.dll => 0x919672ca => 55
	i32 2465273461, ; 164: SQLitePCLRaw.batteries_v2.dll => 0x92f11675 => 62
	i32 2471841756, ; 165: netstandard.dll => 0x93554fdc => 135
	i32 2475788418, ; 166: Java.Interop.dll => 0x93918882 => 137
	i32 2480646305, ; 167: Microsoft.Maui.Controls => 0x93dba8a1 => 56
	i32 2550873716, ; 168: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2570120770, ; 169: System.Text.Encodings.Web => 0x9930ee42 => 127
	i32 2585813321, ; 170: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 38
	i32 2592341985, ; 171: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 46
	i32 2593496499, ; 172: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 173: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 93
	i32 2617129537, ; 174: System.Private.Xml.dll => 0x9bfe3a41 => 120
	i32 2620871830, ; 175: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 73
	i32 2626831493, ; 176: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 177: System.Runtime.Loader => 0x9ec4cf01 => 123
	i32 2692077919, ; 178: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 40
	i32 2732626843, ; 179: Xamarin.AndroidX.Activity => 0xa2e0939b => 66
	i32 2737747696, ; 180: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 68
	i32 2752995522, ; 181: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 182: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 57
	i32 2764765095, ; 183: Microsoft.Maui.dll => 0xa4caf7a7 => 58
	i32 2778768386, ; 184: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 89
	i32 2785988530, ; 185: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 186: Microsoft.Maui.Graphics => 0xa7008e0b => 60
	i32 2806116107, ; 187: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 188: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 71
	i32 2831556043, ; 189: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 190: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 89
	i32 2861189240, ; 191: Microsoft.Maui.Essentials => 0xaa8a4878 => 59
	i32 2868488919, ; 192: CommunityToolkit.Maui.Core => 0xaaf9aad7 => 36
	i32 2892341533, ; 193: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 39
	i32 2909740682, ; 194: System.Private.CoreLib => 0xad6f1e8a => 136
	i32 2911054922, ; 195: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 49
	i32 2916838712, ; 196: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 90
	i32 2919462931, ; 197: System.Numerics.Vectors.dll => 0xae037813 => 116
	i32 2959614098, ; 198: System.ComponentModel.dll => 0xb0682092 => 103
	i32 2978675010, ; 199: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 75
	i32 3038032645, ; 200: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 201: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 82
	i32 3059408633, ; 202: Mono.Android.Runtime => 0xb65adef9 => 138
	i32 3059793426, ; 203: System.ComponentModel.Primitives => 0xb660be12 => 101
	i32 3077302341, ; 204: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3178803400, ; 205: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 83
	i32 3220365878, ; 206: System.Threading => 0xbff2e236 => 131
	i32 3258312781, ; 207: Xamarin.AndroidX.CardView => 0xc235e84d => 69
	i32 3286872994, ; 208: SQLite-net.dll => 0xc3e9b3a2 => 61
	i32 3305363605, ; 209: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 210: System.Net.Requests.dll => 0xc5b097e4 => 115
	i32 3317135071, ; 211: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 74
	i32 3346324047, ; 212: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 84
	i32 3357674450, ; 213: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 214: System.Text.Json => 0xc82afec1 => 128
	i32 3360279109, ; 215: SQLitePCLRaw.core => 0xc849ca45 => 63
	i32 3362522851, ; 216: Xamarin.AndroidX.Core => 0xc86c06e3 => 72
	i32 3366347497, ; 217: Java.Interop => 0xc8a662e9 => 137
	i32 3374999561, ; 218: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 86
	i32 3381016424, ; 219: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3406629867, ; 220: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 47
	i32 3428513518, ; 221: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 44
	i32 3430777524, ; 222: netstandard => 0xcc7d82b4 => 135
	i32 3463511458, ; 223: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3464190856, ; 224: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 38
	i32 3471940407, ; 225: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 102
	i32 3476120550, ; 226: Mono.Android => 0xcf3163e6 => 139
	i32 3479583265, ; 227: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 228: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 229: System.Text.Json.dll => 0xcfbaacae => 128
	i32 3500000672, ; 230: Microsoft.JSInterop => 0xd09dc5a0 => 55
	i32 3509114376, ; 231: System.Xml.Linq => 0xd128d608 => 132
	i32 3580758918, ; 232: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 233: System.Linq.dll => 0xd715a361 => 111
	i32 3624195450, ; 234: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 121
	i32 3641597786, ; 235: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 78
	i32 3643446276, ; 236: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 237: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 83
	i32 3657292374, ; 238: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 43
	i32 3672681054, ; 239: Mono.Android.dll => 0xdae8aa5e => 139
	i32 3697841164, ; 240: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 241: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 82
	i32 3748608112, ; 242: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 105
	i32 3754567612, ; 243: SQLitePCLRaw.provider.e_sqlite3 => 0xdfca27bc => 65
	i32 3786282454, ; 244: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 70
	i32 3792276235, ; 245: System.Collections.NonGeneric => 0xe2098b0b => 98
	i32 3802395368, ; 246: System.Collections.Specialized.dll => 0xe2a3f2e8 => 99
	i32 3817368567, ; 247: CommunityToolkit.Maui.dll => 0xe3886bf7 => 35
	i32 3823082795, ; 248: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3841636137, ; 249: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 45
	i32 3848313649, ; 250: LibraryComponent => 0xe5609b31 => 94
	i32 3849253459, ; 251: System.Runtime.InteropServices.dll => 0xe56ef253 => 122
	i32 3870403116, ; 252: NoteClusterWebApp.dll => 0xe6b1aa2c => 95
	i32 3876362041, ; 253: SQLite-net => 0xe70c9739 => 61
	i32 3889960447, ; 254: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 255: System.Collections.Concurrent.dll => 0xe839deed => 96
	i32 3896760992, ; 256: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 72
	i32 3928044579, ; 257: System.Xml.ReaderWriter => 0xea213423 => 133
	i32 3931092270, ; 258: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 85
	i32 3955647286, ; 259: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 67
	i32 3980434154, ; 260: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 261: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4025784931, ; 262: System.Memory => 0xeff49a63 => 112
	i32 4046471985, ; 263: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 57
	i32 4068434129, ; 264: System.Private.Xml.Linq.dll => 0xf27f60d1 => 119
	i32 4073602200, ; 265: System.Threading.dll => 0xf2ce3c98 => 131
	i32 4094352644, ; 266: Microsoft.Maui.Essentials.dll => 0xf40add04 => 59
	i32 4100113165, ; 267: System.Private.Uri => 0xf462c30d => 118
	i32 4102112229, ; 268: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 269: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 270: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 44
	i32 4127667938, ; 271: System.IO.FileSystem.Watcher => 0xf60736e2 => 109
	i32 4150914736, ; 272: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4164802419, ; 273: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 109
	i32 4181436372, ; 274: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 124
	i32 4182413190, ; 275: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 80
	i32 4213026141, ; 276: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 105
	i32 4271975918, ; 277: Microsoft.Maui.Controls.dll => 0xfea12dee => 56
	i32 4292120959, ; 278: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 80
	i32 4294648842 ; 279: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 48
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [280 x i32] [
	i32 130, ; 0
	i32 33, ; 1
	i32 60, ; 2
	i32 122, ; 3
	i32 70, ; 4
	i32 88, ; 5
	i32 30, ; 6
	i32 31, ; 7
	i32 103, ; 8
	i32 37, ; 9
	i32 2, ; 10
	i32 30, ; 11
	i32 66, ; 12
	i32 15, ; 13
	i32 77, ; 14
	i32 64, ; 15
	i32 14, ; 16
	i32 130, ; 17
	i32 112, ; 18
	i32 34, ; 19
	i32 26, ; 20
	i32 100, ; 21
	i32 76, ; 22
	i32 124, ; 23
	i32 134, ; 24
	i32 117, ; 25
	i32 13, ; 26
	i32 7, ; 27
	i32 54, ; 28
	i32 51, ; 29
	i32 48, ; 30
	i32 21, ; 31
	i32 35, ; 32
	i32 74, ; 33
	i32 19, ; 34
	i32 127, ; 35
	i32 96, ; 36
	i32 1, ; 37
	i32 132, ; 38
	i32 16, ; 39
	i32 4, ; 40
	i32 123, ; 41
	i32 62, ; 42
	i32 115, ; 43
	i32 108, ; 44
	i32 25, ; 45
	i32 53, ; 46
	i32 41, ; 47
	i32 118, ; 48
	i32 107, ; 49
	i32 95, ; 50
	i32 101, ; 51
	i32 28, ; 52
	i32 77, ; 53
	i32 100, ; 54
	i32 50, ; 55
	i32 87, ; 56
	i32 45, ; 57
	i32 3, ; 58
	i32 67, ; 59
	i32 110, ; 60
	i32 79, ; 61
	i32 102, ; 62
	i32 92, ; 63
	i32 134, ; 64
	i32 16, ; 65
	i32 22, ; 66
	i32 46, ; 67
	i32 84, ; 68
	i32 20, ; 69
	i32 18, ; 70
	i32 2, ; 71
	i32 63, ; 72
	i32 75, ; 73
	i32 111, ; 74
	i32 32, ; 75
	i32 87, ; 76
	i32 71, ; 77
	i32 94, ; 78
	i32 0, ; 79
	i32 47, ; 80
	i32 6, ; 81
	i32 97, ; 82
	i32 108, ; 83
	i32 68, ; 84
	i32 54, ; 85
	i32 97, ; 86
	i32 107, ; 87
	i32 10, ; 88
	i32 5, ; 89
	i32 50, ; 90
	i32 129, ; 91
	i32 41, ; 92
	i32 25, ; 93
	i32 81, ; 94
	i32 90, ; 95
	i32 36, ; 96
	i32 73, ; 97
	i32 113, ; 98
	i32 129, ; 99
	i32 40, ; 100
	i32 125, ; 101
	i32 91, ; 102
	i32 114, ; 103
	i32 126, ; 104
	i32 64, ; 105
	i32 69, ; 106
	i32 23, ; 107
	i32 1, ; 108
	i32 39, ; 109
	i32 106, ; 110
	i32 88, ; 111
	i32 51, ; 112
	i32 138, ; 113
	i32 17, ; 114
	i32 76, ; 115
	i32 9, ; 116
	i32 81, ; 117
	i32 92, ; 118
	i32 91, ; 119
	i32 85, ; 120
	i32 52, ; 121
	i32 29, ; 122
	i32 26, ; 123
	i32 110, ; 124
	i32 8, ; 125
	i32 98, ; 126
	i32 119, ; 127
	i32 42, ; 128
	i32 5, ; 129
	i32 79, ; 130
	i32 0, ; 131
	i32 120, ; 132
	i32 78, ; 133
	i32 4, ; 134
	i32 106, ; 135
	i32 49, ; 136
	i32 125, ; 137
	i32 116, ; 138
	i32 65, ; 139
	i32 104, ; 140
	i32 99, ; 141
	i32 58, ; 142
	i32 12, ; 143
	i32 53, ; 144
	i32 52, ; 145
	i32 117, ; 146
	i32 93, ; 147
	i32 113, ; 148
	i32 14, ; 149
	i32 43, ; 150
	i32 8, ; 151
	i32 86, ; 152
	i32 18, ; 153
	i32 136, ; 154
	i32 121, ; 155
	i32 114, ; 156
	i32 133, ; 157
	i32 42, ; 158
	i32 13, ; 159
	i32 37, ; 160
	i32 10, ; 161
	i32 104, ; 162
	i32 55, ; 163
	i32 62, ; 164
	i32 135, ; 165
	i32 137, ; 166
	i32 56, ; 167
	i32 11, ; 168
	i32 127, ; 169
	i32 38, ; 170
	i32 46, ; 171
	i32 20, ; 172
	i32 93, ; 173
	i32 120, ; 174
	i32 73, ; 175
	i32 15, ; 176
	i32 123, ; 177
	i32 40, ; 178
	i32 66, ; 179
	i32 68, ; 180
	i32 21, ; 181
	i32 57, ; 182
	i32 58, ; 183
	i32 89, ; 184
	i32 27, ; 185
	i32 60, ; 186
	i32 6, ; 187
	i32 71, ; 188
	i32 19, ; 189
	i32 89, ; 190
	i32 59, ; 191
	i32 36, ; 192
	i32 39, ; 193
	i32 136, ; 194
	i32 49, ; 195
	i32 90, ; 196
	i32 116, ; 197
	i32 103, ; 198
	i32 75, ; 199
	i32 34, ; 200
	i32 82, ; 201
	i32 138, ; 202
	i32 101, ; 203
	i32 12, ; 204
	i32 83, ; 205
	i32 131, ; 206
	i32 69, ; 207
	i32 61, ; 208
	i32 7, ; 209
	i32 115, ; 210
	i32 74, ; 211
	i32 84, ; 212
	i32 24, ; 213
	i32 128, ; 214
	i32 63, ; 215
	i32 72, ; 216
	i32 137, ; 217
	i32 86, ; 218
	i32 3, ; 219
	i32 47, ; 220
	i32 44, ; 221
	i32 135, ; 222
	i32 11, ; 223
	i32 38, ; 224
	i32 102, ; 225
	i32 139, ; 226
	i32 24, ; 227
	i32 23, ; 228
	i32 128, ; 229
	i32 55, ; 230
	i32 132, ; 231
	i32 31, ; 232
	i32 111, ; 233
	i32 121, ; 234
	i32 78, ; 235
	i32 28, ; 236
	i32 83, ; 237
	i32 43, ; 238
	i32 139, ; 239
	i32 33, ; 240
	i32 82, ; 241
	i32 105, ; 242
	i32 65, ; 243
	i32 70, ; 244
	i32 98, ; 245
	i32 99, ; 246
	i32 35, ; 247
	i32 126, ; 248
	i32 45, ; 249
	i32 94, ; 250
	i32 122, ; 251
	i32 95, ; 252
	i32 61, ; 253
	i32 32, ; 254
	i32 96, ; 255
	i32 72, ; 256
	i32 133, ; 257
	i32 85, ; 258
	i32 67, ; 259
	i32 27, ; 260
	i32 9, ; 261
	i32 112, ; 262
	i32 57, ; 263
	i32 119, ; 264
	i32 131, ; 265
	i32 59, ; 266
	i32 118, ; 267
	i32 22, ; 268
	i32 17, ; 269
	i32 44, ; 270
	i32 109, ; 271
	i32 29, ; 272
	i32 109, ; 273
	i32 124, ; 274
	i32 80, ; 275
	i32 105, ; 276
	i32 56, ; 277
	i32 80, ; 278
	i32 48 ; 279
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
