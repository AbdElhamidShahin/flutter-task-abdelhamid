import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tast_abdelhamid/features/home/logic/cubit.dart';
import 'package:flutter_tast_abdelhamid/features/home/logic/state.dart';
import 'package:flutter_tast_abdelhamid/features/home/ui/home_page.dart';

// هذه هي الشاشة "الذكية" التي تدير الحالات
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // نطلب من الكيوبت جلب البيانات فور بناء الشاشة
    context.read<HomeCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المتجر')),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          // نستخدم .when للتعامل مع كل الحالات بشكل نظيف
          return state.when(
            initial: () => const Center(child: Text('جاري التحضير...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (categories) {
              // عند النجاح، نعرض ودجة HomePage ونمرر لها البيانات
              return HomePage(categories: categories);
            },
            error: (error) => Center(child: Text('حدث خطأ: $error')),
          );
        },
      ),
    );
  }
}
