import 'package:flutter/material.dart';
import 'package:pendataanwarga/providers/berita_panel_provider.dart';
import 'package:pendataanwarga/providers/dashboard_provider.dart';
import 'package:provider/provider.dart';

class BeritaPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<BeritaPanelProvider>().muatdata();

    return Scaffold(
      appBar: AppBar(
        title: Text('Berita'),
      ),
      body: Consumer<BeritaPanelProvider>(builder: (context, prov, w) {
        return ListView(
          padding: EdgeInsets.all(12),
          children: [
            for (final data in prov.data)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${data['title']}'),
                  Container(
                    width: double.maxFinite,
                    height: 200,
                    decoration: BoxDecoration(border: Border.all()),
                    child: Image.network(data['image'] ?? '', fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/logo.png', fit: BoxFit.fill);
                    }),
                  ),
                  Text(
                    '${data['description']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              )
          ],
        );
      }),
    );
  }
}
