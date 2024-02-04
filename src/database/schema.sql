-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 05, 2024 at 12:13 AM
-- Server version: 10.6.16-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2dekansveilingen`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisements`
--

CREATE TABLE `advertisements` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `sellerid` int(11) NOT NULL,
  `description` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `bidder` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `offeredAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bids_history`
--

CREATE TABLE `bids_history` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `bidder` int(11) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `offeredAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chatbot`
--

CREATE TABLE `chatbot` (
  `id` int(11) NOT NULL,
  `message` text NOT NULL,
  `response` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chatbot`
--

INSERT INTO `chatbot` (`id`, `message`, `response`) VALUES
(2, 'help', 'How can I help you?'),
(3, 'Hi, how can I track my order?', 'To track your order, simply log in to your account and go to the \"Order History\" section. There, you can find real-time updates on your shipment.'),
(4, 'What payment methods do you accept?', 'We accept various payment methods, including credit/debit cards, PayPal, and other secure options. You can check the available payment methods during the checkout process.'),
(5, 'Can I return an item?', 'Certainly! If you\'re not satisfied with your purchase, you can initiate a return within 30 days of receiving the product. Visit our Returns page for detailed instructions.'),
(6, 'How do I reset my password?', 'To reset your password, click on the \"Forgot Password\" link on the login page. Follow the instructions sent to your email to create a new password.'),
(7, 'Is my personal information secure?', 'Absolutely! We prioritize the security of your personal information. Our website employs encryption and follows industry best practices to safeguard your data.'),
(8, 'Do you offer international shipping?', 'Yes, we do offer international shipping. During checkout, select your country to view the available shipping options and costs.'),
(9, 'What is your customer support phone number?', 'You can reach our customer support team at [Your Phone Number] during our business hours. Alternatively, you can contact us through the online support form.'),
(10, 'How can I apply a discount code?', 'During the checkout process, you\'ll find a field to enter your discount code. Once applied, the discounted amount will be reflected in your total.'),
(11, 'Are there any ongoing promotions?', 'Check our \"Promotions\" page for information on current discounts and special offers. We update it regularly, so you can find the latest deals there.'),
(12, 'Can I modify my order after placing it?', 'Once an order is placed, it\'s processed quickly to ensure timely delivery. Unfortunately, modifications are not possible. Please double-check your order before confirming.'),
(13, 'What\'s the estimated delivery time?', 'Delivery times vary based on your location and the shipping method selected. You can check the estimated delivery time during the checkout process.'),
(14, 'How can I cancel my order?', 'If your order hasn\'t been shipped yet, you can cancel it by going to the \"Order History\" section in your account. Otherwise, please contact our customer support team for assistance.'),
(15, 'Do you have a size guide for clothing?', 'Yes, you can find our size guide on each product page under the \"Size Chart\" section. It provides measurements to help you choose the right size.'),
(16, 'Is there a warranty on your products?', 'We offer a [Your Warranty Period] warranty on our products. Check the product details or contact customer support for specific warranty information.'),
(17, 'What\'s your return policy for defective items?', 'If you receive a defective item, please contact our customer support team immediately. We will guide you through the return process and provide a replacement.'),
(18, 'Can I change my shipping address?', 'If your order hasn\'t been shipped, you can update your shipping address in the \"Order History\" section. Otherwise, please contact our customer support team for assistance.'),
(19, 'Are gift cards available?', 'Yes, we offer gift cards! You can purchase them on our website, and they make for a perfect gift for your friends and family.'),
(20, 'How do I unsubscribe from newsletters?', 'You can manage your newsletter preferences in your account settings. If you encounter any issues, feel free to contact our customer support team for assistance.'),
(21, 'What\'s your exchange policy?', 'We offer exchanges for items in new and unused condition. Please initiate the exchange process within 30 days of receiving your order. Visit our Returns page for detailed instructions.'),
(22, 'Can I place an order over the phone?', 'We encourage placing orders through our website for security and accuracy. If you encounter any difficulties, please contact our customer support team for assistance.'),
(23, 'Do you have a loyalty program?', 'Yes, we have a loyalty program that rewards you for your purchases. Check our \"Loyalty Program\" page for details on earning and redeeming points.'),
(24, 'What should I do if my payment fails?', 'If your payment fails during the checkout process, double-check your payment information and try again. If the issue persists, contact your bank or use an alternative payment method.'),
(25, 'How can I provide feedback on my shopping experience?', 'We appreciate your feedback! You can share your thoughts through our online survey, or contact our customer support team directly. We value your input.'),
(26, 'What is your holiday shipping schedule?', 'During holidays, we may experience higher order volumes. Check our \"Shipping Information\" page for holiday schedules and order cutoff dates to ensure timely delivery.'),
(27, 'Can I apply multiple discount codes?', 'Sorry, our system allows only one discount code per order. Choose the one that provides the best value for your purchase.'),
(28, 'Are there any restrictions on international orders?', 'International orders may be subject to customs fees and import taxes. Check your country\'s regulations to understand any additional charges that may apply.'),
(29, 'How do I subscribe to your newsletter?', 'You can subscribe to our newsletter by entering your email address in the \"Subscribe\" section at the bottom of our website. Stay updated on the latest promotions and news!'),
(30, 'What should I do if an item is out of stock?', 'If the item you want is out of stock, you can sign up for notifications. We\'ll notify you when it\'s back in stock, or you can explore similar products on our website.'),
(31, 'Can I change the color/size of my order?', 'If your order hasn\'t been shipped, you can update the color/size in the \"Order History\" section. Otherwise, please contact our customer support team for assistance.'),
(32, 'How can I check my gift card balance?', 'You can check your gift card balance in the \"Gift Cards\" section of your account. Enter the card details, and the remaining balance will be displayed.'),
(33, 'What\'s your live chat support hours?', 'Our live chat support is available during business hours. If you reach out outside those hours, you can still leave a message, and we\'ll get back to you as soon as possible.'),
(34, 'How can I unsubscribe from marketing emails?', 'You can manage your email preferences in your account settings or use the \"Unsubscribe\" link at the bottom of our marketing emails. We respect your choice.'),
(35, 'What\'s the status of my refund?', 'Refunds are processed within [Your Refund Processing Time]. You\'ll receive an email notification once the refund is complete. If you have concerns, contact our customer support team.'),
(36, 'What materials are used in your products?', 'You can find detailed information about the materials used in each product on the product page. If you have specific questions, feel free to reach out to our customer support team.'),
(37, 'Can I change the delivery address after placing an order?', 'If your order hasn\'t been shipped, you can update the delivery address in the \"Order History\" section. Otherwise, please contact our customer support team for assistance.'),
(38, 'Do you have a mobile app?', 'Yes, we have a mobile app available for [iOS/Android]. Download it from the App Store/Google Play to enjoy a seamless shopping experience on the go.'),
(39, 'How can I sign up for product updates?', 'You can sign up for product updates by subscribing to our newsletter. Stay informed about new arrivals, promotions, and exclusive offers!'),
(40, 'What\'s your response time for customer inquiries?', 'We strive to respond to customer inquiries within [Your Response Time] during business hours. For urgent matters, feel free to use our live chat for quicker assistance.'),
(41, 'Can I add items to an existing order?', 'Unfortunately, once an order is placed, we cannot add additional items. Please place a new order for any additional items you\'d like to purchase.'),
(42, 'How can I check the status of my warranty claim?', 'You can check the status of your warranty claim by logging into your account and visiting the \"Warranty Claims\" section. Our team will keep you updated on the progress.'),
(43, 'What should I do if I receive a damaged item?', 'We apologize for any inconvenience. Please contact our customer support team with photos of the damaged item, and we\'ll assist you with a replacement or refund.'),
(44, 'Do you offer gift wrapping services?', 'Yes, we offer gift wrapping services! You can select this option during the checkout process to add a special touch to your gift.'),
(45, 'How can I redeem my loyalty points?', 'You can redeem your loyalty points during the checkout process. The available options will be displayed, allowing you to choose the rewards that best suit your preferences.'),
(46, 'What\'s your policy on price adjustments?', 'We do offer price adjustments within [Your Price Adjustment Period]. If the price of an item you purchased drops within this period, contact our customer support team for a refund of the price difference.'),
(47, 'Can I get a refund if the price drops after my purchase?', 'Unfortunately, we cannot provide refunds for price drops after the purchase is completed. Price adjustments are only applicable within [Your Price Adjustment Period].'),
(48, 'How can I join your affiliate program?', 'You can join our affiliate program by visiting our \"Affiliate Program\" page and completing the application process. We look forward to partnering with you!'),
(49, 'What\'s your process for handling lost shipments?', 'If your shipment is marked as lost, please contact our customer support team. We\'ll initiate an investigation with the shipping carrier and work towards a resolution.'),
(50, 'Are there any restrictions on using discount codes?', 'Discount codes may have specific terms and conditions. Check the details provided with the code or visit our \"Discount Code Policy\" page for information on any restrictions.'),
(51, 'What\'s your return policy for items purchased during a sale?', 'Our standard return policy applies to items purchased during a sale. You can find detailed information on our Returns page. Feel free to reach out if you have specific questions.'),
(52, 'How can I update my billing information?', 'You can update your billing information in the \"Billing Information\" section of your account. Ensure that your payment details are accurate to avoid any issues during the checkout process.'),
(53, 'Do you have a size guide for shoes?', 'Yes, we have a size guide specifically for shoes. You can find it on each shoe product page under the \"Size Chart\" section to help you find the perfect fit.'),
(54, 'Can I change the delivery date for my order?', 'Once an order is placed, the delivery date is set. If you have specific concerns, please contact our customer support team, and we\'ll do our best to assist you.'),
(55, 'How can I request a product that is currently out of stock?', 'You can request notification for a restock on the product page. We\'ll notify you once the item is available again, or you can explore similar products in the meantime.'),
(56, 'What\'s your policy on privacy and data protection?', 'We take privacy and data protection seriously. You can review our Privacy Policy for detailed information on how we collect, use, and protect your personal information.'),
(57, 'Can I use multiple gift cards for a single purchase?', 'Yes, you can use multiple gift cards for a single purchase. Enter each gift card code during the checkout process to apply their respective balances.'),
(58, 'How can I check the status of my order processing?', 'You can check the status of your order processing in the \"Order History\" section of your account. We\'ll provide updates on the different stages of processing.'),
(59, 'What should I do if my account is locked?', 'If your account is locked, use the \"Forgot Password\" link on the login page to reset your password. Contact our customer support team if you need further assistance.'),
(60, 'Do you offer customization options for products?', 'Currently, we don\'t offer customization options for products. However, we constantly evaluate customer feedback, so your suggestion is valuable to us.'),
(61, 'How can I share feedback about your website?', 'We appreciate your feedback! You can share your thoughts through our online survey or contact our customer support team. We\'re always looking for ways to improve.'),
(62, 'What steps should I take if I receive the wrong item?', 'If you receive the wrong item, please contact our customer support team immediately. We\'ll guide you through the return process and ensure you receive the correct item.'),
(63, 'Are there any restrictions on international returns?', 'International returns may have specific instructions and conditions. Please review our International Returns policy or contact our customer support team for assistance.'),
(64, 'How do I subscribe to SMS notifications?', 'You can subscribe to SMS notifications by updating your preferences in the \"Notifications\" section of your account. Stay informed about order updates and exclusive offers!'),
(65, 'What precautions are in place for COVID-19?', 'We\'ve implemented various safety measures to ensure the well-being of our customers and staff. Check our \"COVID-19 Updates\" page for information on the precautions we\'re taking.'),
(66, 'Can I use a discount code on sale items?', 'The ability to use a discount code on sale items may vary. Check the terms and conditions of the specific discount code or contact our customer support team for clarification.'),
(67, 'How can I request a refund for a digital product?', 'Refunds for digital products are subject to specific conditions. Please review our Digital Product Refund Policy or contact our customer support team for assistance.'),
(68, 'What\'s your policy on environmental sustainability?', 'We are committed to environmental sustainability. Check our \"Sustainability Initiatives\" page to learn about the steps we\'re taking to minimize our environmental impact.'),
(69, 'Do you offer expedited shipping options?', 'Yes, we offer expedited shipping options for customers who need their orders to arrive faster. You can select these options during the checkout process.'),
(70, 'How can I check the availability of a product in-store?', 'You can check the availability of a product in-store by using the \"Find in Store\" option on the product page. Enter your location to see if the item is in stock near you.'),
(71, 'Can I change the email address associated with my account?', 'Yes, you can update your email address in the \"Account Settings\" section. Ensure that the new email address is accurate to receive important notifications and updates.'),
(72, 'What\'s your process for handling damaged shipments?', 'If you receive a shipment with damaged items, please contact our customer support team immediately. Provide photos of the damaged items, and we\'ll assist you with a replacement or refund.'),
(73, 'How can I participate in your customer loyalty program?', 'You can join our customer loyalty program by signing up on our website. Earn points with every purchase and enjoy exclusive benefits. Check our \"Loyalty Program\" page for more details.'),
(74, 'Are there any restrictions on using loyalty points?', 'Loyalty points may have specific terms and conditions. Check the details on our \"Loyalty Program\" page or contact our customer support team for information on any restrictions.'),
(75, 'What\'s your process for handling defective products?', 'If you receive a defective product, please contact our customer support team with details and photos. We\'ll guide you through the return process and provide a replacement.'),
(76, 'Do you have a mobile-friendly website?', 'Yes, our website is fully optimized for mobile devices. You can shop conveniently on your smartphone or tablet by accessing our site through your preferred web browser.'),
(77, 'How can I opt-out of marketing communications?', 'You can opt-out of marketing communications by adjusting your preferences in the \"Email Preferences\" section of your account. Alternatively, use the \"Unsubscribe\" link in our marketing emails.'),
(78, 'What steps should I take if I forget my account password?', 'If you forget your account password, use the \"Forgot Password\" link on the login page. Follow the instructions sent to your email to reset your password and regain access to your account.'),
(79, 'Can I return an online purchase to a physical store?', 'Currently, we only accept returns for online purchases through our online return process. Contact our customer support team if you encounter any issues with the return process.'),
(80, 'How can I check the status of my warranty claim for electronics?', 'You can check the status of your warranty claim for electronics by logging into your account and visiting the \"Warranty Claims\" section. Our team will keep you updated on the progress.'),
(81, 'What measures are in place for product quality control?', 'We have strict quality control measures to ensure the products meet our standards. If you receive a product that doesn\'t meet your expectations, please contact our customer support team.'),
(82, 'Can I use a gift card and a discount code for a single purchase?', 'Yes, you can use a gift card and a discount code for a single purchase. Enter both the gift card code and discount code during the checkout process.'),
(83, 'How can I provide feedback about a specific product?', 'You can provide feedback about a specific product by writing a review on the product page. Your insights are valuable to us and help other customers make informed decisions.'),
(84, 'Do you offer virtual gift cards?', 'Yes, we offer virtual gift cards that can be sent directly to the recipient\'s email. You can purchase them on our website and include a personalized message.'),
(85, 'What\'s your policy on canceling a subscription?', 'You can cancel your subscription by going to the \"Subscriptions\" section in your account. Ensure that you cancel before the next billing cycle to avoid additional charges.'),
(86, 'How can I check the status of my order during transit?', 'You can track the status of your order during transit by using the tracking number provided in the \"Order History\" section. Follow the link to view real-time updates on your shipment.'),
(87, 'What steps should I take if my account is hacked?', 'If you suspect your account is hacked, change your password immediately through the \"Account Settings\" section. Contact our customer support team for further assistance in securing your account.'),
(88, 'Can I return a gift that I received?', 'Certainly! You can return a gift by initiating the return process within 30 days of receiving it. Contact our customer support team for guidance on returning gifts.'),
(89, 'How can I request a refund for a canceled order?', 'Refunds for canceled orders are processed automatically. You\'ll receive an email notification once the refund is complete. Contact our customer support team if you have any concerns.'),
(90, 'What steps should I take if I receive a suspicious email?', 'If you receive a suspicious email claiming to be from us, do not click any links. Forward the email to our customer support team for verification and guidance.'),
(91, 'Can I apply a discount code after placing an order?', 'Unfortunately, discount codes cannot be applied after an order is placed. Please ensure that you apply the code during the checkout process before confirming your purchase.'),
(92, 'How can I check the warranty status of my product?', 'You can check the warranty status of your product by logging into your account and visiting the \"Warranty Status\" section. Our team will provide information on the remaining warranty period.'),
(93, 'What steps should I take if my payment is declined?', 'If your payment is declined, double-check your payment information and ensure that there are sufficient funds. If the issue persists, contact your bank or use an alternative payment method.'),
(94, 'Can I change the shipping method after placing an order?', 'Once an order is placed, the shipping method is set. If you have specific concerns, please contact our customer support team, and we\'ll do our best to assist you.'),
(95, 'How can I provide feedback about the packaging of my order?', 'You can provide feedback about the packaging of your order by reaching out to our customer support team. We appreciate your input as we continuously strive to improve our packaging.'),
(96, 'Do you offer price matching for products?', 'We do offer price matching under specific conditions. Check our \"Price Matching Policy\" page for details on eligible products and the process for requesting a price match.'),
(97, 'How can I request a refund for a duplicate charge?', 'If you notice a duplicate charge, contact our customer support team immediately with details of the transaction. We\'ll investigate and assist you in resolving the issue.'),
(98, 'Can I purchase a gift card in a specific denomination?', 'Yes, you can purchase a gift card in a specific denomination on our website. Choose the desired amount during the purchase process, and the gift card will be sent to the recipient.'),
(99, 'How can I check the status of my loyalty points?', 'You can check the status of your loyalty points by logging into your account and visiting the \"Loyalty Points\" section. We\'ll provide information on your current points balance and available rewards.'),
(100, 'What precautions are in place for COVID-19 returns?', 'For COVID-19 returns, follow our standard return process. If you have concerns or specific instructions related to COVID-19, please include them when initiating the return.'),
(101, 'Can I use a discount code for a previous purchase?', 'Discount codes are applicable only during the checkout process for new purchases. Unfortunately, they cannot be applied retroactively to previous orders.'),
(102, 'How can I request a refund for a digital download issue?', 'If you experience issues with a digital download, contact our customer support team with details. We\'ll assist you in resolving the issue or provide a refund if necessary.'),
(103, 'What\'s your policy on lost gift cards?', 'If your gift card is lost, contact our customer support team with the purchase details. We\'ll assist you in recovering the card balance or issuing a replacement.'),
(104, 'Can I use a gift card to pay for a subscription?', 'The ability to use a gift card for a subscription may vary. Check the payment options during the subscription process or contact our customer support team for assistance.'),
(105, 'How can I check the expiration date of a gift card?', 'You can check the expiration date of a gift card in the \"Gift Cards\" section of your account. Enter the card details, and the expiration date will be displayed.'),
(106, 'What steps should I take if my order is delayed?', 'If your order is delayed, check the tracking information for real-time updates. Contact our customer support team if you have concerns or if the delay persists.'),
(107, 'Can I return a product without the original packaging?', 'Ideally, we recommend returning products in their original packaging. However, contact our customer support team for guidance if you no longer have the original packaging.'),
(108, 'How can I check the status of my repair request?', 'You can check the status of your repair request by logging into your account and visiting the \"Repair Status\" section. Our team will provide updates on the progress of your request.'),
(109, 'What\'s your policy on returns for personalized items?', 'Returns for personalized items may be subject to specific conditions. Check our \"Personalized Items Return Policy\" for details on eligibility and the return process.'),
(110, 'Do you offer a satisfaction guarantee for your products?', 'Yes, we offer a satisfaction guarantee for our products. If you\'re not satisfied with your purchase, contact our customer support team, and we\'ll work towards a solution.'),
(111, 'How can I check the status of my order if I checked out as a guest?', 'If you checked out as a guest, you can check the status of your order using the order confirmation email. Follow the provided link to view the order details and status.');

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `productid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) DEFAULT NULL,
  `incoming_msg_id` int(11) NOT NULL,
  `outgoing_msg_id` int(11) NOT NULL,
  `msg` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `bidid` int(11) NOT NULL,
  `oldbidder` int(11) NOT NULL,
  `newbidder` int(11) NOT NULL,
  `read` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `buyerid` int(11) NOT NULL,
  `deliverymethod` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `image` varchar(255) NOT NULL,
  `enddate` datetime NOT NULL,
  `deliveryStandard` tinytext NOT NULL DEFAULT '1',
  `deliveryExpress` tinytext NOT NULL DEFAULT '0',
  `deliveryPickup` tinyint(4) NOT NULL DEFAULT 0,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `icon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `type` text NOT NULL,
  `context` text NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `stars` int(11) NOT NULL,
  `description` text NOT NULL,
  `sellerid` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(11) NOT NULL,
  `location` text NOT NULL,
  `text_en` text NOT NULL DEFAULT 'UNAVAILABLE',
  `text_nl` text NOT NULL DEFAULT 'ONBESCHIKBAAR',
  `text_fr` text NOT NULL DEFAULT 'INDISPONIBLE'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `location`, `text_en`, `text_nl`, `text_fr`) VALUES
(1, 'nav', '2nd-chance auctions', '2dekansveilingen', '2ème-chance enchères'),
(2, 'nav', 'Log out', 'Log uit', 'Se déconnecter'),
(3, 'nav', 'Auctions', 'Veilingen', 'Enchères'),
(4, 'nav', 'Location', 'Locatie', 'Emplacement'),
(5, 'nav', 'Products', 'Producten', 'Produits'),
(6, 'nav', 'Messages', 'Berichten', 'Messages'),
(7, 'nav', 'Search', 'Zoeken', 'Recherche'),
(8, 'nav', 'Account Overview', 'Account Overzicht', 'Aperçu du compte'),
(9, 'nav', 'Switch to dark mode', 'Schakel over naar de donkere modus', 'Passer en mode sombre'),
(10, 'nav', 'Switch to light mode', 'Schakel over naar de lichte modus', 'Passer en mode lumière'),
(11, 'nav', 'Storefront', 'Winkel', 'Vitrine'),
(12, 'nav', 'Reports', 'Rapporten', 'Rapports'),
(13, 'nav', 'Translations', 'Vertalingen', 'Traductions'),
(14, 'nav', 'View translations', 'Vertalingen bekijken', 'Voir les traductions'),
(15, 'nav', 'Add translations', 'Vertalingen toevoegen', 'Ajouter des traductions');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `profilepicture` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `theme` text NOT NULL DEFAULT 'light',
  `language` text NOT NULL DEFAULT 'text_en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_role_mapping`
--

CREATE TABLE `user_role_mapping` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `advertisements_userid` (`sellerid`),
  ADD KEY `advertisements_productid` (`productid`);

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bids_userid` (`bidder`),
  ADD KEY `bids_productid` (`productid`);

--
-- Indexes for table `bids_history`
--
ALTER TABLE `bids_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chatbot`
--
ALTER TABLE `chatbot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `favorites_userid` (`userid`),
  ADD KEY `favorites_productid` (`productid`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_oldbidder` (`oldbidder`),
  ADD KEY `notifications_newbidder` (`newbidder`),
  ADD KEY `notifications_bidid` (`bidid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_userid` (`buyerid`),
  ADD KEY `orders_productid` (`productid`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_userid` (`userid`),
  ADD KEY `products_categoryid` (`categoryid`);
ALTER TABLE `products` ADD FULLTEXT KEY `products_search` (`name`,`description`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_userid` (`userid`),
  ADD KEY `reports_productid` (`productid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_sellerid` (`sellerid`),
  ADD KEY `reviews_userid` (`userid`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_profile_userid` (`userid`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_role_mapping_userid` (`userid`),
  ADD KEY `user_role_mapping_roleid` (`roleid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisements`
--
ALTER TABLE `advertisements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bids_history`
--
ALTER TABLE `bids_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `chatbot`
--
ALTER TABLE `chatbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_profile`
--
ALTER TABLE `user_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisements`
--
ALTER TABLE `advertisements`
  ADD CONSTRAINT `advertisements_productid` FOREIGN KEY (`productid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `advertisements_userid` FOREIGN KEY (`sellerid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `bids`
--
ALTER TABLE `bids`
  ADD CONSTRAINT `bids_productid` FOREIGN KEY (`productid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `bids_userid` FOREIGN KEY (`bidder`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `favorites_productid` FOREIGN KEY (`productid`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `favorites_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_bidid` FOREIGN KEY (`bidid`) REFERENCES `bids_history` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `notifications_userid` FOREIGN KEY (`oldbidder`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `notifications_userid2` FOREIGN KEY (`newbidder`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_productid` FOREIGN KEY (`productid`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_userid` FOREIGN KEY (`buyerid`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_categoryid` FOREIGN KEY (`categoryid`) REFERENCES `product_categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `products_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_productid` FOREIGN KEY (`productid`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reports_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_sellerid` FOREIGN KEY (`sellerid`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reviews_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_profile`
--
ALTER TABLE `user_profile`
  ADD CONSTRAINT `user_profile_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_role_mapping`
--
ALTER TABLE `user_role_mapping`
  ADD CONSTRAINT `user_role_mapping_roleid` FOREIGN KEY (`roleid`) REFERENCES `user_roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_role_mapping_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
