; ModuleID = 'marshal_methods.x86_64.ll'
source_filename = "marshal_methods.x86_64.ll"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [140 x ptr] zeroinitializer, align 16

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [280 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 54
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 139
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 59
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 110
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 70
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 87
	i64 545109961164950392, ; 6: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 683390398661839228, ; 7: Microsoft.Extensions.FileProviders.Embedded => 0x97be3f26326c97c => 48
	i64 750875890346172408, ; 8: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 130
	i64 799765834175365804, ; 9: System.ComponentModel.dll => 0xb1956c9f18442ac => 103
	i64 849051935479314978, ; 10: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 870603111519317375, ; 11: SQLitePCLRaw.lib.e_sqlite3.android => 0xc1500ead2756d7f => 64
	i64 872800313462103108, ; 12: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 75
	i64 904021989532492380, ; 13: LibraryComponent.dll => 0xc8bbb35b339e25c => 94
	i64 1120440138749646132, ; 14: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 91
	i64 1121665720830085036, ; 15: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1217390620349809925, ; 16: LibraryComponent => 0x10e50a51b6d7c505 => 94
	i64 1301485588176585670, ; 17: SQLitePCLRaw.core => 0x120fce3f338e43c6 => 63
	i64 1369545283391376210, ; 18: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 83
	i64 1404195534211153682, ; 19: System.IO.FileSystem.Watcher.dll => 0x137cb4660bd87f12 => 109
	i64 1476839205573959279, ; 20: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 114
	i64 1486715745332614827, ; 21: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 56
	i64 1513467482682125403, ; 22: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 138
	i64 1518315023656898250, ; 23: SQLitePCLRaw.provider.e_sqlite3 => 0x151223783a354eca => 65
	i64 1537168428375924959, ; 24: System.Threading.Thread.dll => 0x15551e8a954ae0df => 130
	i64 1556147632182429976, ; 25: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 26: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 68
	i64 1628611045998245443, ; 27: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 80
	i64 1743969030606105336, ; 28: System.Memory.dll => 0x1833d297e88f2af8 => 112
	i64 1767386781656293639, ; 29: System.Private.Uri.dll => 0x188704e9f5582107 => 118
	i64 1776954265264967804, ; 30: Microsoft.JSInterop.dll => 0x18a9027d533bd07c => 55
	i64 1795316252682057001, ; 31: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 67
	i64 1825687700144851180, ; 32: System.Runtime.InteropServices.RuntimeInformation.dll => 0x1956254a55ef08ec => 121
	i64 1835311033149317475, ; 33: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 34: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 87
	i64 1881198190668717030, ; 35: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1920760634179481754, ; 36: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 57
	i64 1959996714666907089, ; 37: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1981742497975770890, ; 38: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 79
	i64 1983698669889758782, ; 39: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 40: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2262844636196693701, ; 41: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 75
	i64 2287834202362508563, ; 42: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 96
	i64 2295368378960711535, ; 43: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x1fdac961189e0f6f => 41
	i64 2302323944321350744, ; 44: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 45: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 78
	i64 2335503487726329082, ; 46: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 127
	i64 2470498323731680442, ; 47: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 71
	i64 2497223385847772520, ; 48: System.Runtime => 0x22a7eb7046413568 => 125
	i64 2547086958574651984, ; 49: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 66
	i64 2602673633151553063, ; 50: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2656907746661064104, ; 51: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 44
	i64 2662981627730767622, ; 52: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2781169761569919449, ; 53: Microsoft.JSInterop => 0x2698b329b26ed1d9 => 55
	i64 2895129759130297543, ; 54: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 55: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 91
	i64 3289520064315143713, ; 56: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 77
	i64 3311221304742556517, ; 57: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 116
	i64 3344514922410554693, ; 58: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 93
	i64 3396143930648122816, ; 59: Microsoft.Extensions.FileProviders.Abstractions => 0x2f2186e9506155c0 => 46
	i64 3429672777697402584, ; 60: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 59
	i64 3494946837667399002, ; 61: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 42
	i64 3522470458906976663, ; 62: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 88
	i64 3551103847008531295, ; 63: System.Private.CoreLib.dll => 0x31480e226177735f => 136
	i64 3567343442040498961, ; 64: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 65: System.Runtime.dll => 0x319037675df7e556 => 125
	i64 3638003163729360188, ; 66: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 43
	i64 3647754201059316852, ; 67: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 133
	i64 3655542548057982301, ; 68: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 42
	i64 3716579019761409177, ; 69: netstandard.dll => 0x3393f0ed5c8c5c99 => 135
	i64 3727469159507183293, ; 70: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 86
	i64 3753897248517198740, ; 71: Microsoft.AspNetCore.Components.WebView.dll => 0x341885a8952f1394 => 40
	i64 3869221888984012293, ; 72: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 51
	i64 3889433610606858880, ; 73: Microsoft.Extensions.FileProviders.Physical.dll => 0x35fa0b4301afd280 => 49
	i64 3890352374528606784, ; 74: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 57
	i64 3933965368022646939, ; 75: System.Net.Requests => 0x369840a8bfadc09b => 115
	i64 3966267475168208030, ; 76: System.Memory => 0x370b03412596249e => 112
	i64 4009997192427317104, ; 77: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 124
	i64 4073500526318903918, ; 78: System.Private.Xml.dll => 0x3887fb25779ae26e => 120
	i64 4120493066591692148, ; 79: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 80: System.ComponentModel => 0x39a7562737acb67e => 103
	i64 4187479170553454871, ; 81: System.Linq.Expressions => 0x3a1cea1e912fa117 => 110
	i64 4205801962323029395, ; 82: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 102
	i64 4337444564132831293, ; 83: SQLitePCLRaw.batteries_v2.dll => 0x3c31b2d9ae16203d => 62
	i64 4356591372459378815, ; 84: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4384840217421645357, ; 85: Microsoft.AspNetCore.Components.Forms => 0x3cda14f22443862d => 38
	i64 4672453897036726049, ; 86: System.IO.FileSystem.Watcher => 0x40d7e4104a437f21 => 109
	i64 4679594760078841447, ; 87: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4794310189461587505, ; 88: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 66
	i64 4795410492532947900, ; 89: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 88
	i64 4853321196694829351, ; 90: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 123
	i64 5083911230767902192, ; 91: NoteClusterWebApp.dll => 0x468dae54238a2df0 => 95
	i64 5103417709280584325, ; 92: System.Collections.Specialized => 0x46d2fb5e161b6285 => 99
	i64 5182934613077526976, ; 93: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 99
	i64 5197073077358930460, ; 94: Microsoft.AspNetCore.Components.Web.dll => 0x481fb66db7b9aa1c => 39
	i64 5290786973231294105, ; 95: System.Runtime.Loader => 0x496ca6b869b72699 => 123
	i64 5423376490970181369, ; 96: System.Runtime.InteropServices.RuntimeInformation => 0x4b43b42f2b7b6ef9 => 121
	i64 5471532531798518949, ; 97: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 98: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 99: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 107
	i64 5573260873512690141, ; 100: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 126
	i64 5692067934154308417, ; 101: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 90
	i64 6068057819846744445, ; 102: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6183170893902868313, ; 103: SQLitePCLRaw.batteries_v2 => 0x55cf092b0c9d6f59 => 62
	i64 6200764641006662125, ; 104: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6222399776351216807, ; 105: System.Text.Json.dll => 0x565a67a0ffe264a7 => 128
	i64 6357457916754632952, ; 106: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 107: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 78
	i64 6478287442656530074, ; 108: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 109: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 74
	i64 6560151584539558821, ; 110: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 53
	i64 6743165466166707109, ; 111: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 112: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 113: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 106
	i64 6876862101832370452, ; 114: System.Xml.Linq => 0x5f6f85a57d108914 => 132
	i64 6894844156784520562, ; 115: System.Numerics.Vectors => 0x5faf683aead1ad72 => 116
	i64 6920570528939222495, ; 116: Microsoft.AspNetCore.Components.WebView => 0x600ace3ab475a5df => 40
	i64 7083547580668757502, ; 117: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 119
	i64 7220009545223068405, ; 118: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 119: System.Linq => 0x64e71ccf51a90a5a => 111
	i64 7377312882064240630, ; 120: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 102
	i64 7488575175965059935, ; 121: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 132
	i64 7489048572193775167, ; 122: System.ObjectModel => 0x67ee71ff6b419e3f => 117
	i64 7654504624184590948, ; 123: System.Net.Http => 0x6a3a4366801b8264 => 113
	i64 7708790323521193081, ; 124: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 125: System.Private.CoreLib => 0x6b0ff375198b9c17 => 136
	i64 7735352534559001595, ; 126: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 92
	i64 7836164640616011524, ; 127: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 68
	i64 8014722069583580780, ; 128: Microsoft.AspNetCore.Components.Forms.dll => 0x6f3a03422b034e6c => 38
	i64 8064050204834738623, ; 129: System.Collections.dll => 0x6fe942efa61731bf => 100
	i64 8083354569033831015, ; 130: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 77
	i64 8087206902342787202, ; 131: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 105
	i64 8167236081217502503, ; 132: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 137
	i64 8185542183669246576, ; 133: System.Collections => 0x7198e33f4794aa70 => 100
	i64 8246048515196606205, ; 134: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 60
	i64 8368701292315763008, ; 135: System.Security.Cryptography => 0x7423997c6fd56140 => 126
	i64 8400357532724379117, ; 136: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 85
	i64 8401899777249686645, ; 137: NoteClusterWebApp => 0x74998b550d66b475 => 95
	i64 8518412311883997971, ; 138: System.Collections.Immutable => 0x76377add7c28e313 => 97
	i64 8563666267364444763, ; 139: System.Private.Uri => 0x76d841191140ca5b => 118
	i64 8599632406834268464, ; 140: CommunityToolkit.Maui => 0x7758081c784b4930 => 35
	i64 8614108721271900878, ; 141: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 142: Java.Interop => 0x77b654e585b55834 => 137
	i64 8639588376636138208, ; 143: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 84
	i64 8677882282824630478, ; 144: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8725526185868997716, ; 145: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 105
	i64 9045785047181495996, ; 146: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9312692141327339315, ; 147: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 90
	i64 9324707631942237306, ; 148: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 67
	i64 9659729154652888475, ; 149: System.Text.RegularExpressions => 0x860e407c9991dd9b => 129
	i64 9678050649315576968, ; 150: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 71
	i64 9702891218465930390, ; 151: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 98
	i64 9808709177481450983, ; 152: Mono.Android.dll => 0x881f890734e555e7 => 139
	i64 9956195530459977388, ; 153: Microsoft.Maui => 0x8a2b8315b36616ac => 58
	i64 9991543690424095600, ; 154: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 155: System.Net.Http.dll => 0x8b50e941206af13b => 113
	i64 10051358222726253779, ; 156: System.Private.Xml => 0x8b7d990c97ccccd3 => 120
	i64 10092835686693276772, ; 157: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 56
	i64 10143853363526200146, ; 158: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10229024438826829339, ; 159: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 74
	i64 10406448008575299332, ; 160: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 93
	i64 10430153318873392755, ; 161: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 72
	i64 10506226065143327199, ; 162: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10734191584620811116, ; 163: Microsoft.Extensions.FileProviders.Embedded.dll => 0x94f7825fc04f936c => 48
	i64 10785150219063592792, ; 164: System.Net.Primitives => 0x95ac8cfb68830758 => 114
	i64 10880838204485145808, ; 165: CommunityToolkit.Maui.dll => 0x970080b2a4d614d0 => 35
	i64 11002576679268595294, ; 166: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 52
	i64 11009005086950030778, ; 167: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 58
	i64 11051904132540108364, ; 168: Microsoft.Extensions.FileProviders.Composite.dll => 0x99604040c7b98e4c => 47
	i64 11103970607964515343, ; 169: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 170: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 89
	i64 11218356222449480316, ; 171: Microsoft.AspNetCore.Components => 0x9baf9b8c02e4f27c => 37
	i64 11220793807500858938, ; 172: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 173: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 53
	i64 11340910727871153756, ; 174: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 73
	i64 11485890710487134646, ; 175: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 122
	i64 11518296021396496455, ; 176: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 177: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 89
	i64 11530571088791430846, ; 178: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 51
	i64 11597940890313164233, ; 179: netstandard => 0xa0f429ca8d1805c9 => 135
	i64 11705530742807338875, ; 180: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11739066727115742305, ; 181: SQLite-net.dll => 0xa2e98afdf8575c61 => 61
	i64 11806260347154423189, ; 182: SQLite-net => 0xa3d8433bc5eb5d95 => 61
	i64 12048689113179125827, ; 183: Microsoft.Extensions.FileProviders.Physical => 0xa7358ae968287843 => 49
	i64 12058074296353848905, ; 184: Microsoft.Extensions.FileSystemGlobbing.dll => 0xa756e2afa5707e49 => 50
	i64 12145679461940342714, ; 185: System.Text.Json => 0xa88e1f1ebcb62fba => 128
	i64 12201331334810686224, ; 186: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 124
	i64 12269460666702402136, ; 187: System.Collections.Immutable.dll => 0xaa45e178506c9258 => 97
	i64 12279246230491828964, ; 188: SQLitePCLRaw.provider.e_sqlite3.dll => 0xaa68a5636e0512e4 => 65
	i64 12341818387765915815, ; 189: CommunityToolkit.Maui.Core.dll => 0xab46f26f152bf0a7 => 36
	i64 12451044538927396471, ; 190: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 76
	i64 12466513435562512481, ; 191: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 81
	i64 12475113361194491050, ; 192: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 193: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 106
	i64 12538491095302438457, ; 194: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 69
	i64 12550732019250633519, ; 195: System.IO.Compression => 0xae2d28465e8e1b2f => 108
	i64 12681088699309157496, ; 196: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 197: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 70
	i64 12823819093633476069, ; 198: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 199: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 54
	i64 13003699287675270979, ; 200: Microsoft.AspNetCore.Components.WebView.Maui => 0xb4766b9b07e27743 => 41
	i64 13221551921002590604, ; 201: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 202: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 203: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 138
	i64 13381594904270902445, ; 204: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 205: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 92
	i64 13467053111158216594, ; 206: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 207: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 208: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13550417756503177631, ; 209: Microsoft.Extensions.FileProviders.Abstractions.dll => 0xbc0cc1280684799f => 46
	i64 13572454107664307259, ; 210: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 86
	i64 13717397318615465333, ; 211: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 101
	i64 13755568601956062840, ; 212: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 213: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 214: System.Console.dll => 0xc0a5f3cade5c6774 => 104
	i64 13959074834287824816, ; 215: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 76
	i64 14100563506285742564, ; 216: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 217: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 69
	i64 14125464355221830302, ; 218: System.Threading.dll => 0xc407bafdbc707a9e => 131
	i64 14461014870687870182, ; 219: System.Net.Requests.dll => 0xc8afd8683afdece6 => 115
	i64 14464374589798375073, ; 220: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 221: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 222: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 127
	i64 14556034074661724008, ; 223: CommunityToolkit.Maui.Core => 0xca016bdea6b19f68 => 36
	i64 14669215534098758659, ; 224: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 44
	i64 14705122255218365489, ; 225: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 226: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14852515768018889994, ; 227: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 73
	i64 14892012299694389861, ; 228: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 229: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 230: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 45
	i64 14987728460634540364, ; 231: System.IO.Compression.dll => 0xcfff1ba06622494c => 108
	i64 15076659072870671916, ; 232: System.ObjectModel.dll => 0xd13b0d8c1620662c => 117
	i64 15111608613780139878, ; 233: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 234: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 107
	i64 15133485256822086103, ; 235: System.Linq.dll => 0xd204f0a9127dd9d7 => 111
	i64 15227001540531775957, ; 236: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 43
	i64 15370334346939861994, ; 237: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 72
	i64 15391712275433856905, ; 238: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 45
	i64 15427448221306938193, ; 239: Microsoft.AspNetCore.Components.Web => 0xd6194e6b4dbb6351 => 39
	i64 15481710163200268842, ; 240: Microsoft.Extensions.FileProviders.Composite => 0xd6da155e291b5a2a => 47
	i64 15527772828719725935, ; 241: System.Console => 0xd77dbb1e38cd3d6f => 104
	i64 15536481058354060254, ; 242: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 243: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 80
	i64 15609085926864131306, ; 244: System.dll => 0xd89e9cf3334914ea => 134
	i64 15661133872274321916, ; 245: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 133
	i64 15664356999916475676, ; 246: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 247: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 248: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 16154507427712707110, ; 249: System => 0xe03056ea4e39aa26 => 134
	i64 16288847719894691167, ; 250: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 251: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 52
	i64 16649148416072044166, ; 252: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 60
	i64 16677317093839702854, ; 253: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 85
	i64 16755018182064898362, ; 254: SQLitePCLRaw.core.dll => 0xe885c843c330813a => 63
	i64 16890310621557459193, ; 255: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 129
	i64 16942731696432749159, ; 256: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 257: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 83
	i64 17008137082415910100, ; 258: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 98
	i64 17031351772568316411, ; 259: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 82
	i64 17062143951396181894, ; 260: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 101
	i64 17079998892748052666, ; 261: Microsoft.AspNetCore.Components.dll => 0xed08587fce5018ba => 37
	i64 17089008752050867324, ; 262: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17205988430934219272, ; 263: Microsoft.Extensions.FileSystemGlobbing => 0xeec7f35113509a08 => 50
	i64 17230721278011714856, ; 264: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 119
	i64 17342750010158924305, ; 265: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 266: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 267: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 268: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17702523067201099846, ; 269: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 270: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 81
	i64 17710060891934109755, ; 271: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 79
	i64 17712670374920797664, ; 272: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 122
	i64 18025913125965088385, ; 273: System.Threading => 0xfa28e87b91334681 => 131
	i64 18099568558057551825, ; 274: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 275: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 82
	i64 18245806341561545090, ; 276: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 96
	i64 18305135509493619199, ; 277: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 84
	i64 18324163916253801303, ; 278: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
	i64 18370042311372477656 ; 279: SQLitePCLRaw.lib.e_sqlite3.android.dll => 0xfeef80274e4094d8 => 64
], align 16

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [280 x i32] [
	i32 54, ; 0
	i32 139, ; 1
	i32 59, ; 2
	i32 110, ; 3
	i32 70, ; 4
	i32 87, ; 5
	i32 7, ; 6
	i32 48, ; 7
	i32 130, ; 8
	i32 103, ; 9
	i32 10, ; 10
	i32 64, ; 11
	i32 75, ; 12
	i32 94, ; 13
	i32 91, ; 14
	i32 18, ; 15
	i32 94, ; 16
	i32 63, ; 17
	i32 83, ; 18
	i32 109, ; 19
	i32 114, ; 20
	i32 56, ; 21
	i32 138, ; 22
	i32 65, ; 23
	i32 130, ; 24
	i32 16, ; 25
	i32 68, ; 26
	i32 80, ; 27
	i32 112, ; 28
	i32 118, ; 29
	i32 55, ; 30
	i32 67, ; 31
	i32 121, ; 32
	i32 6, ; 33
	i32 87, ; 34
	i32 28, ; 35
	i32 57, ; 36
	i32 28, ; 37
	i32 79, ; 38
	i32 2, ; 39
	i32 20, ; 40
	i32 75, ; 41
	i32 96, ; 42
	i32 41, ; 43
	i32 24, ; 44
	i32 78, ; 45
	i32 127, ; 46
	i32 71, ; 47
	i32 125, ; 48
	i32 66, ; 49
	i32 27, ; 50
	i32 44, ; 51
	i32 2, ; 52
	i32 55, ; 53
	i32 7, ; 54
	i32 91, ; 55
	i32 77, ; 56
	i32 116, ; 57
	i32 93, ; 58
	i32 46, ; 59
	i32 59, ; 60
	i32 42, ; 61
	i32 88, ; 62
	i32 136, ; 63
	i32 22, ; 64
	i32 125, ; 65
	i32 43, ; 66
	i32 133, ; 67
	i32 42, ; 68
	i32 135, ; 69
	i32 86, ; 70
	i32 40, ; 71
	i32 51, ; 72
	i32 49, ; 73
	i32 57, ; 74
	i32 115, ; 75
	i32 112, ; 76
	i32 124, ; 77
	i32 120, ; 78
	i32 33, ; 79
	i32 103, ; 80
	i32 110, ; 81
	i32 102, ; 82
	i32 62, ; 83
	i32 30, ; 84
	i32 38, ; 85
	i32 109, ; 86
	i32 0, ; 87
	i32 66, ; 88
	i32 88, ; 89
	i32 123, ; 90
	i32 95, ; 91
	i32 99, ; 92
	i32 99, ; 93
	i32 39, ; 94
	i32 123, ; 95
	i32 121, ; 96
	i32 26, ; 97
	i32 29, ; 98
	i32 107, ; 99
	i32 126, ; 100
	i32 90, ; 101
	i32 23, ; 102
	i32 62, ; 103
	i32 23, ; 104
	i32 128, ; 105
	i32 34, ; 106
	i32 78, ; 107
	i32 11, ; 108
	i32 74, ; 109
	i32 53, ; 110
	i32 19, ; 111
	i32 22, ; 112
	i32 106, ; 113
	i32 132, ; 114
	i32 116, ; 115
	i32 40, ; 116
	i32 119, ; 117
	i32 26, ; 118
	i32 111, ; 119
	i32 102, ; 120
	i32 132, ; 121
	i32 117, ; 122
	i32 113, ; 123
	i32 17, ; 124
	i32 136, ; 125
	i32 92, ; 126
	i32 68, ; 127
	i32 38, ; 128
	i32 100, ; 129
	i32 77, ; 130
	i32 105, ; 131
	i32 137, ; 132
	i32 100, ; 133
	i32 60, ; 134
	i32 126, ; 135
	i32 85, ; 136
	i32 95, ; 137
	i32 97, ; 138
	i32 118, ; 139
	i32 35, ; 140
	i32 21, ; 141
	i32 137, ; 142
	i32 84, ; 143
	i32 21, ; 144
	i32 105, ; 145
	i32 31, ; 146
	i32 90, ; 147
	i32 67, ; 148
	i32 129, ; 149
	i32 71, ; 150
	i32 98, ; 151
	i32 139, ; 152
	i32 58, ; 153
	i32 6, ; 154
	i32 113, ; 155
	i32 120, ; 156
	i32 56, ; 157
	i32 3, ; 158
	i32 74, ; 159
	i32 93, ; 160
	i32 72, ; 161
	i32 1, ; 162
	i32 48, ; 163
	i32 114, ; 164
	i32 35, ; 165
	i32 52, ; 166
	i32 58, ; 167
	i32 47, ; 168
	i32 12, ; 169
	i32 89, ; 170
	i32 37, ; 171
	i32 15, ; 172
	i32 53, ; 173
	i32 73, ; 174
	i32 122, ; 175
	i32 13, ; 176
	i32 89, ; 177
	i32 51, ; 178
	i32 135, ; 179
	i32 9, ; 180
	i32 61, ; 181
	i32 61, ; 182
	i32 49, ; 183
	i32 50, ; 184
	i32 128, ; 185
	i32 124, ; 186
	i32 97, ; 187
	i32 65, ; 188
	i32 36, ; 189
	i32 76, ; 190
	i32 81, ; 191
	i32 34, ; 192
	i32 106, ; 193
	i32 69, ; 194
	i32 108, ; 195
	i32 14, ; 196
	i32 70, ; 197
	i32 27, ; 198
	i32 54, ; 199
	i32 41, ; 200
	i32 1, ; 201
	i32 15, ; 202
	i32 138, ; 203
	i32 9, ; 204
	i32 92, ; 205
	i32 29, ; 206
	i32 30, ; 207
	i32 13, ; 208
	i32 46, ; 209
	i32 86, ; 210
	i32 101, ; 211
	i32 8, ; 212
	i32 11, ; 213
	i32 104, ; 214
	i32 76, ; 215
	i32 3, ; 216
	i32 69, ; 217
	i32 131, ; 218
	i32 115, ; 219
	i32 24, ; 220
	i32 5, ; 221
	i32 127, ; 222
	i32 36, ; 223
	i32 44, ; 224
	i32 16, ; 225
	i32 32, ; 226
	i32 73, ; 227
	i32 33, ; 228
	i32 0, ; 229
	i32 45, ; 230
	i32 108, ; 231
	i32 117, ; 232
	i32 17, ; 233
	i32 107, ; 234
	i32 111, ; 235
	i32 43, ; 236
	i32 72, ; 237
	i32 45, ; 238
	i32 39, ; 239
	i32 47, ; 240
	i32 104, ; 241
	i32 4, ; 242
	i32 80, ; 243
	i32 134, ; 244
	i32 133, ; 245
	i32 4, ; 246
	i32 12, ; 247
	i32 5, ; 248
	i32 134, ; 249
	i32 18, ; 250
	i32 52, ; 251
	i32 60, ; 252
	i32 85, ; 253
	i32 63, ; 254
	i32 129, ; 255
	i32 25, ; 256
	i32 83, ; 257
	i32 98, ; 258
	i32 82, ; 259
	i32 101, ; 260
	i32 37, ; 261
	i32 32, ; 262
	i32 50, ; 263
	i32 119, ; 264
	i32 10, ; 265
	i32 25, ; 266
	i32 8, ; 267
	i32 20, ; 268
	i32 31, ; 269
	i32 81, ; 270
	i32 79, ; 271
	i32 122, ; 272
	i32 131, ; 273
	i32 19, ; 274
	i32 82, ; 275
	i32 96, ; 276
	i32 84, ; 277
	i32 14, ; 278
	i32 64 ; 279
], align 16

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 16

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+crc32,+cx16,+cx8,+fxsr,+mmx,+popcnt,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.2xx @ 96b6bb65e8736e45180905177aa343f0e1854ea3"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
