<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>License Agreement</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            line-height: 1.7;
            color: #2d3748;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .header {
            background: linear-gradient(135deg, #1a202c 0%, #2d3748 100%);
            color: white;
            padding: 40px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="%23ffffff" opacity="0.1"/><circle cx="75" cy="75" r="1" fill="%23ffffff" opacity="0.1"/><circle cx="25" cy="75" r="1" fill="%23ffffff" opacity="0.05"/><circle cx="75" cy="25" r="1" fill="%23ffffff" opacity="0.05"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            opacity: 0.3;
        }

        .header h1 {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 15px;
            position: relative;
            z-index: 1;
        }

        .header .subtitle {
            font-size: 1.1rem;
            font-weight: 300;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        .navigation {
            padding: 30px 40px;
            background: rgba(247, 250, 252, 0.8);
            border-bottom: 1px solid rgba(226, 232, 240, 0.5);
        }

        .nav-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: #1a202c;
            margin-bottom: 20px;
            text-align: center;
        }

        .nav-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
            margin-top: 20px;
        }

        .nav-card {
            background: white;
            border-radius: 16px;
            padding: 20px;
            text-align: center;
            text-decoration: none;
            color: #2d3748;
            transition: all 0.3s ease;
            border: 2px solid transparent;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        .nav-card:hover {
            transform: translateY(-5px);
            border-color: #667eea;
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.2);
            text-decoration: none;
            color: #667eea;
        }

        .nav-card .flag {
            font-size: 2rem;
            margin-bottom: 8px;
            display: block;
        }

        .nav-card .lang-name {
            font-weight: 600;
            font-size: 1.1rem;
            margin-bottom: 5px;
        }

        .nav-card .lang-native {
            font-size: 0.9rem;
            opacity: 0.7;
        }

        .content {
            padding: 40px;
        }

        .section {
            margin-bottom: 60px;
            opacity: 0;
            animation: fadeInUp 0.8s ease forwards;
        }

        .section:nth-child(1) { animation-delay: 0.1s; }
        .section:nth-child(2) { animation-delay: 0.2s; }
        .section:nth-child(3) { animation-delay: 0.3s; }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .section-header {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 3px solid #e2e8f0;
        }

        .section-header .flag {
            font-size: 2.5rem;
            margin-right: 15px;
        }

        .section-header h2 {
            font-size: 1.8rem;
            font-weight: 600;
            color: #1a202c;
        }

        .copyright-box {
            background: linear-gradient(135deg, #f7fafc 0%, #edf2f7 100%);
            border-radius: 16px;
            padding: 25px;
            margin-bottom: 30px;
            border-left: 5px solid #667eea;
        }

        .copyright-box .name {
            font-weight: 700;
            font-size: 1.2rem;
            color: #1a202c;
            margin-bottom: 8px;
        }

        .copyright-box .contact {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }

        .copyright-box .contact:hover {
            text-decoration: underline;
        }

        .subsection {
            margin-bottom: 35px;
        }

        .subsection h3 {
            font-size: 1.3rem;
            font-weight: 600;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .permitted {
            background: linear-gradient(135deg, #f0fff4 0%, #c6f6d5 100%);
            border-radius: 16px;
            padding: 25px;
            border-left: 5px solid #48bb78;
        }

        .restricted {
            background: linear-gradient(135deg, #fff5f5 0%, #fed7d7 100%);
            border-radius: 16px;
            padding: 25px;
            border-left: 5px solid #f56565;
        }

        .permission-box {
            background: linear-gradient(135deg, #ebf8ff 0%, #bee3f8 100%);
            border-radius: 16px;
            padding: 25px;
            border-left: 5px solid #4299e1;
        }

        ul {
            list-style: none;
            padding: 0;
        }

        li {
            margin-bottom: 12px;
            padding-left: 30px;
            position: relative;
            font-weight: 400;
        }

        .permitted li::before {
            content: '✅';
            position: absolute;
            left: 0;
            font-size: 1.2rem;
        }

        .restricted li::before {
            content: '❌';
            position: absolute;
            left: 0;
            font-size: 1.2rem;
        }

        .legal-notice {
            background: linear-gradient(135deg, #fffaf0 0%, #feebc8 100%);
            border-radius: 16px;
            padding: 20px;
            margin-top: 20px;
            border-left: 5px solid #ed8936;
            font-weight: 500;
        }

        .footer {
            background: linear-gradient(135deg, #1a202c 0%, #2d3748 100%);
            color: white;
            padding: 30px;
            text-align: center;
            font-size: 0.95rem;
        }

        .footer .copyright {
            font-weight: 600;
            margin-bottom: 15px;
            font-size: 1.1rem;
        }

        .footer .multilingual {
            opacity: 0.8;
            font-style: italic;
            line-height: 1.6;
        }

        /* Arabic text styling */
        .arabic {
            font-family: 'Poppins', 'Segoe UI', Tahoma, Arial, sans-serif;
            direction: rtl;
            text-align: right;
        }

        .arabic .subsection {
            text-align: right;
        }

        .arabic .section-header {
            flex-direction: row-reverse;
        }

        .arabic .section-header .flag {
            margin-right: 0;
            margin-left: 15px;
        }

        @media (max-width: 768px) {
            .container {
                margin: 10px;
                border-radius: 16px;
            }
            
            .header, .content {
                padding: 25px;
            }
            
            .navigation {
                padding: 20px 25px;
            }
            
            .header h1 {
                font-size: 2rem;
            }
            
            .nav-grid {
                grid-template-columns: 1fr;
                gap: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>📜 LICENSE</h1>
            <div class="subtitle">Accord de Licence d'Utilisation Limitée | اتفاقية ترخيص الاستخدام المحدود | Limited Use License Agreement</div>
        </div>

        <div class="navigation">
            <div class="nav-title">🧭 Navigation</div>
            <div class="nav-grid">
                <a href="#francais" class="nav-card">
                    <span class="flag">🇫🇷</span>
                    <div class="lang-name">Français</div>
                    <div class="lang-native">Accord de Licence</div>
                </a>
                <a href="#arabic" class="nav-card">
                    <span class="flag">🇸🇦</span>
                    <div class="lang-name">العربية</div>
                    <div class="lang-native">اتفاقية الترخيص</div>
                </a>
                <a href="#english" class="nav-card">
                    <span class="flag">🇬🇧</span>
                    <div class="lang-name">English</div>
                    <div class="lang-native">License Agreement</div>
                </a>
            </div>
        </div>

        <div class="content">
            <div class="section" id="francais">
                <div class="section-header">
                    <span class="flag">🇫🇷</span>
                    <h2>Français - Accord de Licence d'Utilisation Limitée</h2>
                </div>

                <div class="copyright-box">
                    <div class="name">Copyright © 2025 Abdelhakim Baalla</div>
                    <div>Tous droits réservés.</div>
                    <div>Contact : <a href="mailto:abdelhakimbaalla50@gmail.com" class="contact">abdelhakimbaalla50@gmail.com</a></div>
                </div>

                <p style="margin-bottom: 30px; font-weight: 500;">Ce travail (le "Contenu") est protégé par les lois internationales sur le droit d'auteur.</p>

                <div class="subsection">
                    <h3>🔓 Utilisations Autorisées</h3>
                    <div class="permitted">
                        <ul>
                            <li>Télécharger et stocker une copie du contenu sur votre appareil personnel</li>
                            <li>Consulter, lire ou utiliser le contenu <strong>à des fins personnelles et non commerciales uniquement</strong></li>
                        </ul>
                    </div>
                </div>

                <div class="subsection">
                    <h3>🚫 Utilisations Interdites</h3>
                    <div class="restricted">
                        <ul>
                            <li>Copier, modifier ou créer des œuvres dérivées</li>
                            <li>Publier ou partager le contenu publiquement (en ligne ou hors ligne)</li>
                            <li>Redistribuer le contenu à des tiers</li>
                            <li>Utiliser le contenu à des fins commerciales ou éducatives</li>
                            <li>Inclure le contenu dans tout projet, code, site web ou support</li>
                            <li>Utiliser le contenu dans des ensembles de données pour l'IA, des robots d'indexation ou des outils automatisés</li>
                        </ul>
                    </div>
                </div>

                <div class="subsection">
                    <h3>📬 Demandes d'Autorisation</h3>
                    <div class="permission-box">
                        <p>Pour des exceptions (collaboration, usage éducatif, licence commerciale), contactez :</p>
                        <p style="margin-top: 15px;"><strong>📧 <a href="mailto:abdelhakimbaalla50@gmail.com" class="contact">abdelhakimbaalla50@gmail.com</a></strong></p>
                        
                        <div class="legal-notice">
                            <strong>⚖️ Avertissement Légal :</strong> Une utilisation non autorisée peut entraîner des poursuites judiciaires.
                        </div>
                    </div>
                </div>

                <p style="text-align: center; font-weight: 600; color: #667eea; font-size: 1.1rem;">Merci de respecter les droits de l'auteur.</p>
            </div>

            <div class="section arabic" id="arabic">
                <div class="section-header">
                    <span class="flag">🇸🇦</span>
                    <h2>العربية - اتفاقية ترخيص الاستخدام المحدود</h2>
                </div>

                <div class="copyright-box">
                    <div class="name">جميع الحقوق محفوظة © 2025 عبد الحكيم باعلا</div>
                    <div>للتواصل: <a href="mailto:abdelhakimbaalla50@gmail.com" class="contact">abdelhakimbaalla50@gmail.com</a></div>
                </div>

                <p style="margin-bottom: 30px; font-weight: 500;">هذا العمل (المشار إليه بـ "المحتوى") محمي بموجب قوانين حقوق النشر الدولية.</p>

                <div class="subsection">
                    <h3>🔓 الاستخدامات المسموح بها</h3>
                    <div class="permitted">
                        <ul>
                            <li>تنزيل نسخة من المحتوى وتخزينها على جهازك الشخصي</li>
                            <li>عرض المحتوى أو قراءته أو استخدامه <strong>لأغراض شخصية وغير تجارية فقط</strong></li>
                        </ul>
                    </div>
                </div>

                <div class="subsection">
                    <h3>🚫 الاستخدامات المحظورة</h3>
                    <div class="restricted">
                        <ul>
                            <li>نسخ أو تعديل المحتوى أو إنشاء أعمال مشتقة منه</li>
                            <li>نشر أو مشاركة المحتوى علنًا (عبر الإنترنت أو خارجه)</li>
                            <li>إعادة توزيع المحتوى لأي طرف ثالث</li>
                            <li>استخدام المحتوى في مواد تعليمية أو تجارية</li>
                            <li>تضمين المحتوى في أي مشروع أو كود أو موقع إلكتروني أو وسائط</li>
                            <li>استخدام المحتوى في تدريب الذكاء الاصطناعي أو أدوات الزحف أو الأدوات الآلية</li>
                        </ul>
                    </div>
                </div>

                <div class="subsection">
                    <h3>📬 طلبات الإذن</h3>
                    <div class="permission-box">
                        <p>للحصول على استثناءات (التعاون، الاستخدام التعليمي، الترخيص التجاري)، يرجى التواصل:</p>
                        <p style="margin-top: 15px;"><strong>📧 <a href="mailto:abdelhakimbaalla50@gmail.com" class="contact">abdelhakimbaalla50@gmail.com</a></strong></p>
                        
                        <div class="legal-notice">
                            <strong>⚖️ تحذير قانوني:</strong> قد يؤدي الاستخدام غير المصرح به إلى اتخاذ إجراءات قانونية.
                        </div>
                    </div>
                </div>

                <p style="text-align: center; font-weight: 600; color: #667eea; font-size: 1.1rem;">شكرًا لاحترامك حقوق المُنشئ.</p>
            </div>

            <div class="section" id="english">
                <div class="section-header">
                    <span class="flag">🇬🇧</span>
                    <h2>English - Limited Use License Agreement</h2>
                </div>

                <div class="copyright-box">
                    <div class="name">Copyright © 2025 Abdelhakim Baalla</div>
                    <div>All rights reserved.</div>
                    <div>Contact: <a href="mailto:abdelhakimbaalla50@gmail.com" class="contact">abdelhakimbaalla50@gmail.com</a></div>
                </div>

                <p style="margin-bottom: 30px; font-weight: 500;">This work (the "Content") is protected under international copyright laws.</p>

                <div class="subsection">
                    <h3>🔓 Permitted Uses</h3>
                    <div class="permitted">
                        <ul>
                            <li>Download and store a copy of the Content on your personal device</li>
                            <li>View, read, or use the Content <strong>for personal, non-commercial purposes only</strong></li>
                        </ul>
                    </div>
                </div>

                <div class="subsection">
                    <h3>🚫 Restricted Uses</h3>
                    <div class="restricted">
                        <ul>
                            <li>Copy, modify, or create derivative works</li>
                            <li>Publish or share the Content publicly (online or offline)</li>
                            <li>Redistribute the Content to any third parties</li>
                            <li>Use the Content in commercial or educational materials</li>
                            <li>Include the Content in any project, codebase, website, or media</li>
                            <li>Use the Content in AI training datasets, web scrapers, or automated tools</li>
                        </ul>
                    </div>
                </div>

                <div class="subsection">
                    <h3>📬 Permission Requests</h3>
                    <div class="permission-box">
                        <p>For exceptions (collaboration, educational use, commercial licensing), contact:</p>
                        <p style="margin-top: 15px;"><strong>📧 <a href="mailto:abdelhakimbaalla50@gmail.com" class="contact">abdelhakimbaalla50@gmail.com</a></strong></p>
                        
                        <div class="legal-notice">
                            <strong>⚖️ Legal Notice:</strong> Unauthorized use may result in legal consequences.
                        </div>
                    </div>
                </div>

                <p style="text-align: center; font-weight: 600; color: #667eea; font-size: 1.1rem;">Thank you for respecting the creator's rights.</p>
            </div>
        </div>

        <div class="footer">
            <div class="copyright">© 2025 Abdelhakim Baalla - All Rights Reserved</div>
            <div class="multilingual">
                This license is available in three languages for accessibility.<br>
                Cette licence est disponible en trois langues pour l'accessibilité.<br>
                هذا الترخيص متاح بثلاث لغات لسهولة الوصول.
            </div>
        </div>
    </div>
</body>
</html>
