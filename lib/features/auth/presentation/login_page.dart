import 'package:flutter/material.dart';

import '../../dashboard/presentation/dashboard_page.dart';
import '../data/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final AuthService authService;

  const LoginPage({
    super.key,
    required this.authService,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController =
      TextEditingController(text: 'demo');

  String _selectedLanguage = 'Türkçe';
  bool _isHumanVerified = false;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_isHumanVerified) {
      setState(() {
        _errorMessage =
            'Devam etmek için “Ben robot değilim” alanını işaretleyin.';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await widget.authService.login(
        username: _usernameController.text,
        language: _selectedLanguage,
      );

      if (!mounted) {
        return;
      }

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const DashboardPage(),
        ),
      );
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _errorMessage = error.toString().replaceFirst('Exception: ', '');
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(
                      Icons.hexagon_outlined,
                      size: 64,
                      color: Color(0xFF246BFE),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'PERSUS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Mobil Uygulama Giriş Ekranı',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      controller: _usernameController,
                      autofocus: true,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: const InputDecoration(
                        labelText: 'Kullanıcı',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      initialValue: _selectedLanguage,
                      decoration: const InputDecoration(
                        labelText: 'Dil',
                        prefixIcon: Icon(Icons.language),
                      ),
                      items: const [
                        DropdownMenuItem(
                          value: 'Türkçe',
                          child: Text('Türkçe'),
                        ),
                        DropdownMenuItem(
                          value: 'English',
                          child: Text('English'),
                        ),
                      ],
                      onChanged: _isLoading
                          ? null
                          : (value) {
                              if (value != null) {
                                setState(() {
                                  _selectedLanguage = value;
                                });
                              }
                            },
                    ),
                    const SizedBox(height: 16),
                    Material(
                      color: _isHumanVerified
                          ? colorScheme.primaryContainer.withValues(alpha: 0.35)
                          : colorScheme.surface,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: _isHumanVerified
                              ? colorScheme.primary
                              : colorScheme.outline,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: CheckboxListTile(
                        value: _isHumanVerified,
                        controlAffinity: ListTileControlAffinity.leading,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        title: const Text(
                          'Ben robot değilim',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        secondary: Icon(
                          Icons.verified_user_outlined,
                          color: _isHumanVerified
                              ? colorScheme.primary
                              : colorScheme.onSurfaceVariant,
                        ),
                        onChanged: _isLoading
                            ? null
                            : (value) {
                                setState(() {
                                  _isHumanVerified = value ?? false;
                                  _errorMessage = null;
                                });
                              },
                      ),
                    ),
                    if (_errorMessage != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        _errorMessage!,
                        style: TextStyle(
                          color: colorScheme.error,
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    FilledButton(
                      onPressed: _isLoading ? null : _login,
                      child: _isLoading
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                          : const Text('Bağlan'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}