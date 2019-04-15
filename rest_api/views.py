from django.http import HttpResponse

def sample(request):
    return HttpResponse("Test endpoint")