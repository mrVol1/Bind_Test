import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: const TransactionList(),
    );
  }
}

class TransactionList extends StatefulWidget {
  const TransactionList({Key? key}) : super(key: key);
  @override
  State<TransactionList> createState() => _TransactionList();
}

class _TransactionList extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView(
          children: [
            const SizedBox(
              height: 12.0,
            ),
            _totalBalance(),
            const SizedBox(
              height: 36.0,
            ),
            _transactionHistory(),
            _listTransactions(),
          ],
        ),
      ),
    );
  }

  Widget _totalBalance() {
    return Column(
      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.elliptical(64, 64),
            ),
            image: DecorationImage(
              image: ExactAssetImage(
                  'assets/images/flag_of_the_united_states.png'),
            ),
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 120.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'USD Account',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 24.0,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.white54,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                child: const Text(
                  'Hide',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 24.0,
        ),
        const Text(
          '\$ 180,970.83',
          style: TextStyle(color: Colors.white, fontSize: 36.0),
        ),
      ],
    );
  }

  Widget _transactionHistory() {
    return Container(
      color: Colors.white.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.only(
            top: 12.0, left: 8.0, right: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Transaction History',
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            ),
            const SizedBox(
              height: 12.0,
            ),
            _coinsFilters(context),
            const SizedBox(
              height: 12.0,
            ),
            _allFilter(),
          ],
        ),
      ),
    );
  }

  late int _value = 1;
  Widget _coinsFilters(BuildContext context) {
    return Container(
      height: 45.0,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white12),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<int>(
          dropdownColor: Colors.grey,
          borderRadius: const BorderRadius.all(
            Radius.circular(10.0),
          ),
          icon: const Icon(Icons.arrow_drop_down_sharp),
          value: _value,
          style: const TextStyle(color: Colors.white, fontSize: 12.0),
          onChanged: (value) {
            setState(() {
              _value = value!;
            });
          },
          items: const [
            DropdownMenuItem(
              child: Text('USD Dollar'),
              value: 1,
            ),
            DropdownMenuItem(
              child: Text('GBP'),
              value: 2,
            ),
            DropdownMenuItem(child: Text('RUB'), value: 3),
            DropdownMenuItem(child: Text('EUR'), value: 4),
          ],
        ),
      ),
    );
  }

  Widget _allFilter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _allFilters(context),
        const SizedBox(
          width: 6.0,
        ),
        Container(
          height: 45.0,
          width: 45.0,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            ),
            border: Border.all(
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          child: InkWell(
            onTap: () {},
            child: const Icon(
              Icons.calendar_month,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  late int _value1 = 1;
  Widget _allFilters(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Container(
        height: 45.0,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white12),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
            dropdownColor: Colors.grey,
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
            icon: const Icon(Icons.arrow_drop_down_sharp),
            value: _value1,
            style: const TextStyle(color: Colors.white, fontSize: 12.0),
            onChanged: (value) {
              setState(() {
                _value1 = value!;
              });
            },
            items: const [
              DropdownMenuItem(
                child: Text('All'),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text('GBP'),
                value: 2,
              ),
              DropdownMenuItem(child: Text('RUB'), value: 3),
              DropdownMenuItem(child: Text('EUR'), value: 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listTransactions() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 45.0,
          width: double.infinity,
          color: Colors.white.withOpacity(0.7),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Yesterdey',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ),
        ),
        Container(
          height: 200.0,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(64, 64),
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/circle_nike.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Nike',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '12:23',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      '- \$55.31 USD',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2.0,
                thickness: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(64, 64),
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/circle_nike.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Nike',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '12:23',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      '- \$55.31 USD',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2.0,
                thickness: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(64, 64),
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/circle_nike.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Nike',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '12:23',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      '- \$55.31 USD',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 45.0,
          width: double.infinity,
          color: Colors.white.withOpacity(0.7),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Sat, Dec 11',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ),
        ),
        Container(
          height: 200.0,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(64, 64),
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/circle_nike.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Nike',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '12:23',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      '- \$55.31 USD',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2.0,
                thickness: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(64, 64),
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/circle_nike.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Nike',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '12:23',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      '- \$55.31 USD',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2.0,
                thickness: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(64, 64),
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/circle_nike.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Nike',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '12:23',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      '- \$55.31 USD',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 45.0,
          width: double.infinity,
          color: Colors.white.withOpacity(0.7),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Thurs, Dec 9',
              style: TextStyle(color: Colors.black, fontSize: 16.0),
            ),
          ),
        ),
        Container(
          height: 200.0,
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(64, 64),
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/circle_nike.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Nike',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '12:23',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      '- \$55.31 USD',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2.0,
                thickness: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(64, 64),
                            ),
                            image: DecorationImage(
                              image: ExactAssetImage(
                                  'assets/images/circle_nike.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              'Nike',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.0),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Text(
                              '12:23',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Text(
                      '- \$55.31 USD',
                      style: TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 2.0,
                thickness: 2.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
