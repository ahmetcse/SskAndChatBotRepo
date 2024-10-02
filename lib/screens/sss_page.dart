import 'package:flutter/material.dart';

class SSSPage extends StatelessWidget {
  final List<Map<String, String>> faqList = [
    {
      'question': 'Nasıl üye olabilirim?',
      'answer':
          'Uygulama ana sayfasından "Üye Ol" butonuna tıklayarak üye olabilirsiniz.'
    },
    {
      'question': 'Şifremi nasıl değiştirebilirim?',
      'answer':
          'Hesap ayarları sayfasından "Şifre Değiştir" seçeneğini kullanarak şifrenizi değiştirebilirsiniz.'
    },
    {
      'question': 'Canlı desteğe nasıl ulaşabilirim?',
      'answer':
          'Ana menüde yer alan "Canlı Destek" butonuna tıklayarak destek hattımıza ulaşabilirsiniz.'
    },
    {
      'question': 'Ödemeleri nasıl yapabilirim?',
      'answer':
          'Ödemelerinizi uygulama içinden güvenli bir şekilde kredi kartı veya havale ile yapabilirsiniz.'
    },
    {
      'question': 'Randevu iptali nasıl yapılır?',
      'answer':
          'Randevularım sayfasında iptal etmek istediğiniz randevunun üzerine tıklayarak iptal edebilirsiniz.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sık Sorulan Sorular'),
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(
              faqList[index]['question']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(faqList[index]['answer']!),
              ),
            ],
          );
        },
      ),
    );
  }
}
