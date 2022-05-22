import 'package:flutter/material.dart';

import '../../../buttons/link_text.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      height:  (size.width > 100) ? size.height * 0.10 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText( text:'About',onTap: (){ print('click'); },),
          LinkText( text:'Help Center',onTap: (){ print('click'); }),
          LinkText( text:'Contact',onTap: (){ print('click'); }),
          LinkText( text:'Terms of Service',onTap: (){ print('click'); }),
          LinkText( text:'Cookie Policy',onTap: (){ print('click'); }),
          LinkText( text:'Ads info',onTap: (){ print('click'); }),
          LinkText( text:'Blog',onTap: (){ print('click'); }),
          LinkText( text:'Status',onTap: (){ print('click'); }),
          LinkText( text:'Careers',onTap: (){ print('click'); }),
          LinkText( text:'Brands',onTap: (){ print('click'); }),
          LinkText( text:'Marketing',onTap: (){ print('click'); }),
          LinkText( text:'Maps',onTap: (){ print('click'); }),
          LinkText( text:'Services',onTap: (){ print('click'); }),
        ],
      ),
    );
  }
}