# 📋 Loading Overlay Implementation Guide

## ✅ What We Created

A reusable `LoadingOverlay` widget that shows a `LinearProgressIndicator` at the top of any screen while maintaining the current UI.

## 🎯 Benefits

1. ✅ **Visual Feedback** - Shows loading progress at screen top
2. ✅ **No UI Disruption** - Content stays visible during loading
3. ✅ **Disabled Interaction** - Prevents user actions while loading
4. ✅ **Consistent UX** - Same loading pattern across all auth screens
5. ✅ **Type-Safe** - Works with your Freezed LoadingType enum

---

## 📦 How to Use LoadingOverlay

### **Step 1: Import the Widget**

```dart
import 'package:pa_sreens/src/core/widgets/loading_overlay.dart';
```

### **Step 2: Wrap Your Page Content**

```dart
BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    // Check if loading a specific operation
    final isLoading = state.maybeMap(
      loading: (l) => l.type == LoadingType.yourOperationType,
      orElse: () => false,
    );

    return LoadingOverlay(
      isLoading: isLoading,
      progressColor: AppTheme.primary(context),
      child: YourPageContent(),
    );
  },
)
```

---

## 🔧 Apply to Each Auth Page

### **1. Login Page** ✅ DONE

```dart
// Already implemented!
final isLoading = state.maybeMap(
  loading: (l) => l.type == LoadingType.login,
  orElse: () => false,
);

return LoadingOverlay(
  isLoading: isLoading,
  progressColor: AppTheme.primary(context),
  child: Center(child: SingleChildScrollView(...)),
);
```

---

### **2. Signup Page**

**File:** `lib/src/features/auth_new/authentication/presentation/pages/signup_page.dart`

**Changes needed:**

1. Add import:
```dart
import '../../../../../core/widgets/loading_overlay.dart';
```

2. Update the BlocBuilder:
```dart
child: BlocBuilder<AuthBloc, AuthState>(
  builder: (context, state) {
    // Check for signup loading
    final isLoading = state.maybeMap(
      loading: (l) => l.type == LoadingType.signup,
      orElse: () => false,
    );

    return LoadingOverlay(
      isLoading: isLoading,
      progressColor: AppTheme.primary(context),
      child: Center(
        child: SingleChildScrollView(
          // ... existing content
        ),
      ),
    );
  },
)
```

3. Remove old loading indicators from form

---

### **3. Email Verification Page**

**File:** `lib/src/features/auth_new/authentication/presentation/pages/email_verification_page.dart`

**Check for TWO loading types:**

```dart
final isLoading = state.maybeMap(
  loading: (l) =>
    l.type == LoadingType.verifyEmail ||
    l.type == LoadingType.resendOtp ||
    l.type == LoadingType.verifyResetToken,
  orElse: () => false,
);

return LoadingOverlay(
  isLoading: isLoading,
  progressColor: AppTheme.primary(context),
  child: YourContent(),
);
```

---

### **4. Forgot Password Page**

**File:** `lib/src/features/auth_new/authentication/presentation/pages/forgot_password_page.dart`

```dart
final isLoading = state.maybeMap(
  loading: (l) => l.type == LoadingType.sendPasswordReset,
  orElse: () => false,
);

return LoadingOverlay(
  isLoading: isLoading,
  progressColor: AppTheme.primary(context),
  child: YourContent(),
);
```

---

### **5. Reset Password Page**

**File:** `lib/src/features/auth_new/authentication/presentation/pages/reset_password_page.dart`

```dart
final isLoading = state.maybeMap(
  loading: (l) => l.type == LoadingType.resetPassword,
  orElse: () => false,
);

return LoadingOverlay(
  isLoading: isLoading,
  progressColor: AppTheme.primary(context),
  child: YourContent(),
);
```

---

## 🎨 Customization Options

### **Basic Usage:**
```dart
LoadingOverlay(
  isLoading: isLoading,
  child: YourWidget(),
)
```

### **With Custom Colors:**
```dart
LoadingOverlay(
  isLoading: isLoading,
  progressColor: Colors.blue,
  backgroundColor: Colors.grey.withValues(alpha: 0.2),
  child: YourWidget(),
)
```

### **Allow Interaction While Loading:**
```dart
LoadingOverlay(
  isLoading: isLoading,
  disableInteraction: false, // User can still interact
  child: YourWidget(),
)
```

---

## 📊 Visual Behavior

### **When NOT Loading:**
```
┌─────────────────────┐
│                     │
│   Your Page         │
│   Content           │
│                     │
└─────────────────────┘
```

### **When Loading:**
```
┌─────────────────────┐
│ ████████████░░░░░   │ ← LinearProgressIndicator
├─────────────────────┤
│                     │
│   Your Page         │ ← Semi-transparent overlay
│   Content           │ ← Interaction disabled
│   (slightly dim)    │
│                     │
└─────────────────────┘
```

---

## 🔍 How It Works Internally

```dart
Stack(
  children: [
    // Your content
    AbsorbPointer(
      absorbing: isLoading, // Blocks touch events
      child: child,
    ),

    // Progress bar at top
    if (isLoading)
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: LinearProgressIndicator(),
      ),

    // Semi-transparent overlay
    if (isLoading)
      Positioned.fill(
        child: Container(
          color: Colors.black.withValues(alpha: 0.1),
        ),
      ),
  ],
)
```

---

## ✅ Benefits Over Old Approach

### **❌ Old Way:**
```dart
isLoading
  ? CircularProgressIndicator()  // Replaces entire content
  : YourButton()
```

**Problems:**
- Content disappears during loading
- User loses context
- Jarring UX transition

### **✅ New Way:**
```dart
LoadingOverlay(
  isLoading: isLoading,
  child: YourContent(),  // Always visible
)
```

**Benefits:**
- Content stays visible
- Better user experience
- Professional loading indicator
- Prevents accidental clicks

---

## 🚀 Quick Implementation Checklist

For each auth page:

- [ ] Add import: `import '../../../../../core/widgets/loading_overlay.dart';`
- [ ] Identify the correct `LoadingType` for that page
- [ ] Wrap page content with `LoadingOverlay`
- [ ] Remove old `CircularProgressIndicator` or loading buttons
- [ ] Test loading behavior

---

## 📝 Example: Complete Page Structure

```dart
class YourAuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background(context),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          // Handle navigation and errors
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            final isLoading = state.maybeMap(
              loading: (l) => l.type == LoadingType.yourType,
              orElse: () => false,
            );

            return LoadingOverlay(
              isLoading: isLoading,
              progressColor: AppTheme.primary(context),
              child: Center(
                child: SingleChildScrollView(
                  // Your form and content
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
```

---

## 🎯 LoadingType Reference

Use these with your pages:

| Page | LoadingType |
|------|------------|
| Login | `LoadingType.login` |
| Signup | `LoadingType.signup` |
| Email Verification | `LoadingType.verifyEmail` |
| Resend OTP | `LoadingType.resendOtp` |
| Forgot Password | `LoadingType.sendPasswordReset` |
| Verify Reset Token | `LoadingType.verifyResetToken` |
| Reset Password | `LoadingType.resetPassword` |
| Google Sign In | `LoadingType.googleSignIn` |
| Logout | `LoadingType.logout` |

---

## 🐛 Troubleshooting

### **Loading indicator not showing?**
- Check that `isLoading` is actually `true`
- Verify correct `LoadingType` is used
- Use `print(state)` to debug state changes

### **Can still interact during loading?**
- Ensure `disableInteraction: true` (default)
- Check that `LoadingOverlay` wraps entire content

### **Progress bar wrong color?**
- Set `progressColor: AppTheme.primary(context)`

---

## 🎉 Result

Now all your auth screens will have:
- ✅ Professional loading indicators
- ✅ Consistent UX across all pages
- ✅ No content disruption
- ✅ Disabled interaction during loading
- ✅ Type-safe state checking

**Your users will have a much better experience!** 🚀
