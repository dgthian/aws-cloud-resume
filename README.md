# ☁️ AWS Cloud Resume Challenge

A cloud-native resume website built on AWS as part of the **Cloud Resume Challenge**. This project demonstrates practical experience with AWS services, Infrastructure as Code, serverless development, and CI/CD.

## 🌐 Live Demo

**Website:** https://d18xxtbyevhmrf.cloudfront.net/

---

## 🏗️ Architecture

```
Browser
    │
    ▼
CloudFront
    │
    ▼
S3 Static Website
    │
    ▼
JavaScript
    │
    ▼
Lambda Function URL
    │
    ▼
AWS Lambda
    │
    ▼
Amazon DynamoDB
```

---

## 🚀 Features

- Responsive resume website
- Hosted on Amazon S3
- Global content delivery with CloudFront
- HTTPS using AWS Certificate Manager (ACM)
- Visitor counter powered by AWS Lambda
- Visitor count stored in Amazon DynamoDB
- IAM least-privilege permissions
- Infrastructure managed with Terraform
- Automated deployment with GitHub Actions *(if applicable)*

---

## 🛠️ AWS Services Used

- Amazon S3
- Amazon CloudFront
- AWS Lambda
- Amazon DynamoDB
- AWS IAM
- AWS Certificate Manager (ACM)
- Amazon Route 53 *(if using a custom domain)*

---

## 💻 Technologies

- HTML5
- CSS3
- JavaScript
- Python
- Terraform
- GitHub Actions

---

## 📂 Project Structure

```
aws-cloud-resume/
├── frontend/
│   ├── index.html
│   ├── style.css
│   ├── script.js
│   └── assets/
│
├── backend/
│   └── lambda_function.py
│
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf
│
└── README.md
```

---

## ⚙️ Deployment

### Clone the repository

```bash
git clone https://github.com/dgthian/aws-cloud-resume.git
cd aws-cloud-resume
```

### Deploy Infrastructure

```bash
terraform init
terraform plan
terraform apply
```

### Deploy Lambda

```bash
zip lambda.zip lambda_function.py

aws lambda update-function-code \
    --function-name cloudResumeApi \
    --zip-file fileb://lambda.zip
```

### Upload Website

```bash
aws s3 sync frontend/ s3://YOUR_BUCKET_NAME
```

### Invalidate CloudFront Cache

```bash
aws cloudfront create-invalidation \
    --distribution-id YOUR_DISTRIBUTION_ID \
    --paths "/*"
```

---

## 📸 Screenshots

Add screenshots of:

- Resume homepage
- Visitor counter
- AWS Architecture Diagram

---

## 📚 What I Learned

- Static website hosting with Amazon S3
- CloudFront distribution configuration
- HTTPS with ACM
- IAM permissions and security best practices
- Serverless APIs using AWS Lambda
- DynamoDB CRUD operations
- Infrastructure as Code with Terraform
- Frontend integration with serverless backend
- Cloud deployment and troubleshooting

---

## 📖 References

- Cloud Resume Challenge
- AWS Documentation
- Terraform Documentation

---

## 👤 Author

**Djibril Gueye Thiandoum**

- LinkedIn: https://www.linkedin.com/in/djibril-gueye-thiandoum-7a319571/
- GitHub: https://github.com/dgthian
- Website: https://d18xxtbyevhmrf.cloudfront.net/
