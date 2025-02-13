import 'package:flutter/material.dart';

class DataVisualizationPage extends StatelessWidget {
  const DataVisualizationPage({super.key});

  static const tealBlue = Color(0xFF00BCD4);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'データ可視化',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          _buildProjectProgressChart(context),
          const SizedBox(height: 24),
          _buildTaskDistributionChart(context),
          const SizedBox(height: 24),
          _buildTeamContributionChart(context),
        ],
      ),
    );
  }

  Widget _buildProjectProgressChart(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: tealBlue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.trending_up_rounded,
                    color: tealBlue,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'プロジェクト進捗',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceVariant.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.all(16),
                child: CustomPaint(
                  painter: _ProgressChartPainter(
                    values: const [0.3, 0.5, 0.4, 0.7, 0.6, 0.8, 0.9],
                    color: tealBlue,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                7,
                (index) => Text(
                  '${index + 1}月',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskDistributionChart(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.pie_chart_rounded,
                    color: theme.colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'タスク分布',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AspectRatio(
              aspectRatio: 1,
              child: CustomPaint(
                painter: _PieChartPainter(
                  values: const [0.4, 0.3, 0.2, 0.1],
                  colors: [
                    tealBlue,
                    theme.colorScheme.secondary,
                    theme.colorScheme.tertiary,
                    theme.colorScheme.error,
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildLegend(
              context,
              '機能開発',
              tealBlue,
              '40%',
            ),
            const SizedBox(height: 8),
            _buildLegend(
              context,
              'バグ修正',
              theme.colorScheme.secondary,
              '30%',
            ),
            const SizedBox(height: 8),
            _buildLegend(
              context,
              'UI改善',
              theme.colorScheme.tertiary,
              '20%',
            ),
            const SizedBox(height: 8),
            _buildLegend(
              context,
              'ドキュメント',
              theme.colorScheme.error,
              '10%',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(
    BuildContext context,
    String label,
    Color color,
    String value,
  ) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: tealBlue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildTeamContributionChart(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: BorderSide(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.tertiary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.bar_chart_rounded,
                    color: theme.colorScheme.tertiary,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'チーム貢献度',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            AspectRatio(
              aspectRatio: 16 / 9,
              child: CustomPaint(
                painter: _BarChartPainter(
                  values: const [0.8, 0.6, 0.9, 0.5, 0.7],
                  color: theme.colorScheme.tertiary,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTeamMember(context, 'Alice', '80%'),
                _buildTeamMember(context, 'Bob', '60%'),
                _buildTeamMember(context, 'Carol', '90%'),
                _buildTeamMember(context, 'Dave', '50%'),
                _buildTeamMember(context, 'Eve', '70%'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(
      BuildContext context, String name, String contribution) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(
          name,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          contribution,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.tertiary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _ProgressChartPainter extends CustomPainter {
  const _ProgressChartPainter({
    required this.values,
    required this.color,
  });

  final List<double> values;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final width = size.width;
    final height = size.height;
    final stepX = width / (values.length - 1);

    path.moveTo(0, height * (1 - values[0]));
    for (var i = 1; i < values.length; i++) {
      path.lineTo(stepX * i, height * (1 - values[i]));
    }

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        color,
        color.withOpacity(0.5),
      ],
    );

    paint.shader = gradient.createShader(
      Rect.fromLTWH(0, 0, width, height),
    );

    canvas.drawPath(path, paint);

    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withOpacity(0.2),
          color.withOpacity(0),
        ],
      ).createShader(
        Rect.fromLTWH(0, 0, width, height),
      );

    final fillPath = Path.from(path)
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();

    canvas.drawPath(fillPath, fillPaint);

    final dotPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (var i = 0; i < values.length; i++) {
      canvas.drawCircle(
        Offset(stepX * i, height * (1 - values[i])),
        4,
        dotPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PieChartPainter extends CustomPainter {
  const _PieChartPainter({
    required this.values,
    required this.colors,
  });

  final List<double> values;
  final List<Color> colors;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(
      size.width * 0.1,
      size.height * 0.1,
      size.width * 0.8,
      size.height * 0.8,
    );

    var startAngle = -90.0 * (3.14159 / 180);
    for (var i = 0; i < values.length; i++) {
      final sweepAngle = values[i] * 2 * 3.14159;
      final paint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;

      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _BarChartPainter extends CustomPainter {
  const _BarChartPainter({
    required this.values,
    required this.color,
  });

  final List<double> values;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final barWidth = width / (values.length * 2);

    for (var i = 0; i < values.length; i++) {
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(
          i * (width / values.length) + (width / values.length - barWidth) / 2,
          height * (1 - values[i]),
          barWidth,
          height * values[i],
        ),
        const Radius.circular(8),
      );

      final paint = Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color,
            color.withOpacity(0.6),
          ],
        ).createShader(
          Rect.fromLTWH(0, 0, width, height),
        );

      canvas.drawRRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
