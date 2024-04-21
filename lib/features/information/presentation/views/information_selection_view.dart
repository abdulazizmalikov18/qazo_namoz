import 'package:flutter/material.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';

class InformationSelectionView extends StatelessWidget {
  const InformationSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma’lumot"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Savol:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: SizeConfig.h(12)),
            const Text(
              "Varius tempus est potenti sit viverra. Vel integer interdum fringilla vestibulum ac consectetur nunc?",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: SizeConfig.h(24)),
            const Text(
              "Javob:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: SizeConfig.h(12)),
            const Text(
              "Volutpat enim at eget rhoncus. Purus posuere gravida vestibulum magna. Nulla mattis accumsan, ac at. Curabitur pellentesque urna dui egestas cum massa nascetur diam. Risus fusce phasellus gravida donec velit accumsan est platea. Porttitor tempus, et vulputate donec. Et, quis sed pulvinar sed iaculis sollicitudin maecenas at. Hac turpis viverra ut in etiam fermentum. Felis senectus fermentum risus tortor amet quis eu dictum pretium. Aliquam id ipsum et amet sed pretium.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
