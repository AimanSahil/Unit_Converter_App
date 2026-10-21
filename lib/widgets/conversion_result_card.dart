import 'package:flutter/material.dart';

class ConversionResultCard extends StatelessWidget {
  final String from;
  final String to;
  final String? result;
  final String? input;

  const ConversionResultCard({
    super.key,
    required this.from,
    required this.to,
    required this.result,
    required this.input,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(19, 18, 19, 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.white, Color(0xFFFDFEFF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFE3EAF7)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF243E70).withOpacity(.07),
            blurRadius: 22,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFFEAF0FF),
                  borderRadius: BorderRadius.circular(11),
                ),
                child: const Icon(Icons.auto_awesome_rounded,
                    color: Color(0xFF356AE6), size: 18),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text('CONVERSION RESULT',
                    style: TextStyle(
                      color: Color(0xFF8592A8),
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.15,
                    )),
              ),
              const Icon(Icons.check_circle_rounded,
                  color: Color(0xFF32B889), size: 18),
            ],
          ),
          const SizedBox(height: 20),
          if (result == null)
            const Text('Your result will appear here',
                style: TextStyle(color: Color(0xFF9AA5B7), fontSize: 15))
          else ...[
            Text('$input $from =',
                style: const TextStyle(color: Color(0xFF7D8AA1), fontSize: 13)),
            const SizedBox(height: 7),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Flexible(
                  child: Text(result!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF2E67DE),
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -.8,
                      )),
                ),
                const SizedBox(width: 8),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(to,
                      style: const TextStyle(
                        color: Color(0xFF50617D),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      )),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Container(
              height: 1,
              color: const Color(0xFFEEF1F7),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.info_outline_rounded,
                    color: Color(0xFF9AA5B7), size: 15),
                const SizedBox(width: 6),
                Expanded(
                  child: Text('Converted from $from to $to',
                      style: const TextStyle(
                        color: Color(0xFF8A96A9),
                        fontSize: 12,
                      )),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
